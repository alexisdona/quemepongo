package domain;

//import java.util.HashSet;
//import java.util.Set;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

import domain.clima.Clima;
import domain.notificacion.Notificador;
import domain.clima.Alerta;
import domain.notificacion.SMS;
import domain.notificacion.Whatsapp;
import domain.prenda.Color;
import domain.prenda.Material;
import domain.prenda.TipoDePrenda;
import domain.prenda.Trama;
import domain.usuario.*;
import domain.usuario.transiciones.*;
import exceptions.*;
import org.uqbar.commons.model.annotations.Observable;
import org.uqbar.commons.model.annotations.Transactional;

import javax.persistence.*;

import static domain.clima.Alerta.GRANIZO;
import static domain.clima.Alerta.LLUVIA;
import static java.time.LocalDate.now;

@Transactional
@Observable
@Entity
@Table(name = "usuarios")
public class Usuario {


    @Id
    @GeneratedValue
    @Column(name = "usuario_id",columnDefinition = "int(11) NOT NULL")
    private long id;

    @ManyToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "usuarios_guardarropas",joinColumns = @JoinColumn(name="usuario_id"),inverseJoinColumns = @JoinColumn(name = "guardarropa_id"))
    private Set<Guardarropa> guardarropas = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id",columnDefinition = "int(11) NOT NULL")
    private List<Evento> eventos = new ArrayList<>();

    /*  @OneToMany
    @JoinColumn(name = "decision_id")*/
    @Transient
    private LinkedList<Decision> decisiones = new LinkedList<>();
    @Column(name = "numero_celular")
    private String numeroDeCelular;
    @Column(name = "nombre")
    private String nombre;

    public String getApellido() {
        return apellido;
    }

    private String apellido;

    private String email;
    @Column(name = "contrasenia")
    private String contraseniaHash;

   /* @OneToMany
    @JoinTable(name="atuendo")
    @JoinColumn(name = "atuendo_id",columnDefinition = "int(11) NOT NULL")*/
   @Transient
    private List<Atuendo> atuendosAceptados = new ArrayList<>();

  /*  @OneToMany
    @JoinTable(name="atuendo")
    @JoinColumn(name = "atuendo_id",columnDefinition = "int(11) NOT NULL")*/
   @Transient
    private List<Atuendo> atuendosRechazados = new ArrayList<>();

    @Transient
    private Set<Notificador> notificadores = new HashSet<>();

    @Transient
   private Calendario calendario;

   @Column(name = "tiempo_anticipacion")
    private Integer tiempoDeAnticipacion = 0; // variable que indica con cuanto tiempo antes quiere que le llegue sugerencia sobre evento (en horas)

    @Transient
    private AtuendosSugeridosPorEvento atuendosSugeridosProximoEvento = new AtuendosSugeridosPorEvento(new ArrayList<Atuendo>(), new Evento("", "", LocalDateTime.now(), Periodo.NINGUNO, 0));

    @Transient
    private Sensibilidad sensibilidad = new Sensibilidad();

    public String getContrasenia() {
        return contraseniaHash;
    }

    public List<Atuendo> obtenerSugerenciasCalificadas() {
        return calendario.obtenerEventos().stream().filter(e -> e.tieneAtuendoAceptado()).map(
                e -> e.obtenerSugerenciaAceptada()
        ).collect(Collectors.toList());
    }

    public void setContrasenia(String contrasenia) {
        this.contraseniaHash = contrasenia;
    }

    //
    // variable que indique con cuanto tiempo antes quiere que le llegue sugerencia sobre evento

    // alertador le pide al repo que usuarios ejecutar (los filtra para saber a quienes notificar en base al tiempo de anticipacion que tenga el user)
    // a. notificador tiene que obtener de usuario proximo evento y tiempo de anticipacion y en base a eso devuelve si quiere o no ser notificado
    // se le pide el proximo evento al user, se obtiene el clima de mismo
    // b. se genera sugerencia con ese clima

    public Usuario() {} // solo para JPA
    public Usuario(String numeroDeCelular,Calendario miCalendario,String contrasenia,String email, String nombre,String apellido) {
        this.numeroDeCelular = numeroDeCelular;
        this.calendario = miCalendario;
        this.email=email;
        this.contraseniaHash = SHA1.getInstance().convertirConHash(contrasenia);
        this.nombre = nombre;
        this.apellido = apellido;
    }

    @PostLoad void onPostLoad() {
        this.calendario = new Calendario(eventos);
    }

    public Evento obtenerEvento(Long id) {
        return eventos.stream().filter(evento -> evento.getId() == id).collect(Collectors.toList()).get(0);
    }

    public void validarContraseniaHash(String contrasenia){
        if(!this.contraseniaHash.equals(contrasenia)){
            throw  new ContraseniaInvalidaException("Contraseña inválida");
        }
    }

    public String getEmail() { return this.email; }

    public void calificarSensibilidadGeneral(CalificacionSensibilidad calificacionSensibilidad) {
        this.sensibilidad.calificarSensibilidad(calificacionSensibilidad, "general");
    }

    public void calificarSensibilidadEnManos(CalificacionSensibilidad calificacionSensibilidad) {
        this.sensibilidad.calificarSensibilidad(calificacionSensibilidad, "manos");
    }

    public void calificarSensibilidadEnCuello(CalificacionSensibilidad calificacionSensibilidad) {
        this.sensibilidad.calificarSensibilidad(calificacionSensibilidad, "cuello");
    }

    public double getFactorSensibilidadGeneral() {
        return this.sensibilidad.getFactorSensibilidad("general");
    }

    public double getFactorSensibilidadEnManos() {
        return this.sensibilidad.getFactorSensibilidad("manos");
    }

    public double getFactorSensibilidadEnCuello() {
        return this.sensibilidad.getFactorSensibilidad("cuello");
    }
    public void setNumeroDeCelular(String numeroDeCelular) {
        this.numeroDeCelular = numeroDeCelular;
    }

    public void setCalendario(Calendario calendario) {
        this.calendario = calendario;
    }

    public void generarSugerenciasParaProximoEvento() {
        List<Atuendo> atuendosSugeridos = new ArrayList<>();
        List<Atuendo> atuendos = new ArrayList<>();
        Evento proximoEvento = this.calendario.obtenerProximoEvento();
        for (Guardarropa guardarropa : guardarropas) {

            int diaEvento = -1;
            for (int i = 0; i < 5; i++) {
                if (proximoEvento.getFecha().minusDays(i).toLocalDate().equals(LocalDateTime.now().toLocalDate())) {
                    diaEvento = i;
                }
            }
            if (diaEvento != -1 && proximoEvento.obtenerSugerencias().size() <= 0) {
                atuendos = guardarropa.generarSugerencia(proximoEvento, sensibilidad);
                atuendosSugeridos.addAll(atuendos);
                proximoEvento.guardarSugerencias(atuendos);
                //atuendos.forEach( atuendo -> RepositorioAtuendos.getInstance().actualizarAtuendo(atuendo) );
                RepositorioEventos.getInstance().actualizarEvento(proximoEvento);
            }
        }
        this.atuendosSugeridosProximoEvento = new AtuendosSugeridosPorEvento(atuendosSugeridos, proximoEvento);
    }

    public List<Decision> obtenerDecisiones() {
        return this.decisiones;
    }

    public List<Atuendo> obtenerAtuendosAceptados() {
        return this.atuendosAceptados;
    }

    public List<Atuendo> obtenerAtuendosRechazados() {
        return this.atuendosRechazados;
    }


    public Set<Guardarropa> getGuardarropas() {
        return this.guardarropas;
    }

    //
    public void aceptarAtuendo(Atuendo atuendo) {
        atuendo.aceptar();
        this.atuendosAceptados.add(atuendo); //validar que el atuendo no se pueda aceptar dos veces.
        this.decisiones.addFirst(new Aceptar(atuendo));
    }

    public void rechazarAtuendo(Atuendo atuendo) {
        atuendo.rechazar();
        atuendosRechazados.add(atuendo); //validar que el atuendo no se pueda rechazar dos veces.
        this.decisiones.addFirst(new Rechazar(atuendo));
    }

    public void calificarAtuendo(Atuendo atuendo, int nuevaCalificacion) {
        atuendo.calificar(nuevaCalificacion); // se califica por parte de cuerpo
        // factor de abrigo (sensibilidad) que es modificada por calificacion
        // se relaciona directamente con temperatura
        // calcular en base a una recta el factor de abrigo entre prenda y temperatura (excel recta)
        if (atuendo.estaCalificado()) {
            this.decisiones.addFirst(new Recalificar(atuendo));
        } else {
            this.decisiones.addFirst(new Calificar(atuendo));
        }
    }

    public void deshacer() { //deshacemos el último cambio
        if (decisiones.isEmpty()) {
            throw new PilaVaciaException("No hay decisiones por deshacer");
        }
        this.decisiones.removeFirst().deshacer(this);
    }

    public void agregarEvento(Evento evento) {
        this.eventos.add(evento);
        this.calendario.agregarEvento(evento);
    }

    public void validarEventoDia() {
        List<Evento> eventosDeHoy = calendario.obtenerEventosPorFecha(now());
        if (eventosDeHoy.isEmpty()) {
            throw new NoHayEventoCercanoException("No hay ningún evento para hoy");
        }
    }
    public long getId() {
        return this.id;
    }
    public String getNumeroDeCelular() {
        return numeroDeCelular;
    }

    public void agregarNotificador(Notificador notificador) {
        notificadores.add(notificador);
    }

    public void quitarNotificador(Notificador notificador) {
        notificadores.remove(notificador);
    }

    public void recibirAlertas(List<Alerta> alertas) {
        alertas.forEach(this::recibirAlerta);
    }

    public void recibirAlerta(Alerta alerta) {
        for (Notificador notificador : notificadores) {
            if (alerta == LLUVIA && this.seDebeResugerir(LLUVIA)) {
                this.generarSugerenciasParaProximoEvento();
                notificador.notificar(this, "Alerta meteorologica de lluvia");
            }
            if (alerta == GRANIZO && this.seDebeResugerir(GRANIZO)) {
                this.generarSugerenciasParaProximoEvento();
                notificador.notificar(this, "Alerta meteorologica de granizo");
            }
        }
    }

    public Calendario getCalendario() {
        return this.calendario;
    }

    public boolean quiereSerNotificado() {
        LocalDateTime ahora = LocalDateTime.now();
        LocalDateTime fechaProximoEvento = this.getCalendario().obtenerProximoEvento().getFecha();
        return (ahora.isBefore(fechaProximoEvento)
                && ahora.isAfter(fechaProximoEvento.minusHours(tiempoDeAnticipacion)))
                || ahora.isEqual(fechaProximoEvento.minusHours(tiempoDeAnticipacion));
    }

    public boolean sugerenciasListasParaProximoEvento() {
        return (atuendosSugeridosProximoEvento.getEvento().getFecha() == this.calendario.obtenerProximoEvento().getFecha()
                && atuendosSugeridosProximoEvento.getEvento().getNombre().equals(this.calendario.obtenerProximoEvento().getNombre())
                && atuendosSugeridosProximoEvento.getEvento().getUbicacion().equals(this.calendario.obtenerProximoEvento().getUbicacion()));
    }

    public Set<Notificador> getNotificadores() {
        return notificadores;
    }

    public void notificar(String mensaje) {
        (new SMS()).notificar(this, mensaje);
    }

    public boolean seDebeResugerir(Alerta alerta) {
        if (alerta == LLUVIA) {
            return this.atuendosSugeridosProximoEvento.getAtuendosSugeridos().stream().noneMatch(atuendo -> atuendo.esAptoParaLluvia());
        } else {
            return this.atuendosSugeridosProximoEvento.getAtuendosSugeridos().stream().noneMatch(atuendo -> atuendo.obtenerAccesorio().obtenerTipoDePrenda() == TipoDePrenda.CASCO);
        }
    }

    public AtuendosSugeridosPorEvento obtenerAtuendosSugeridosProximoEvento() {
        return atuendosSugeridosProximoEvento;
    }

    public void verificarSiHayEventoProximo() {
        // todo: que es esto?!?!?!?!??!?!
        Clima clima = new Clima(1 / 11 / 10, 10, 20, 20, 20);
        List<Evento> eventosProximos = calendario.eventosProximos();
        eventosProximos.forEach(evento -> sugerenciaParaEvento(evento));
    }

    public void sugerenciaParaEvento(Evento evento) {
        this.guardarropas.forEach(guardarropa -> {
            List <Atuendo> sugerencias = guardarropa.generarSugerencia(evento, sensibilidad);
            //sugerencias.forEach(atuendo -> RepositorioAtuendos.getInstance().actualizarAtuendo(atuendo));
            evento.guardarSugerencias(sugerencias);
        });
    }

    public void agregarGuardarropa(Guardarropa guardarropa) {
        this.guardarropas.add(guardarropa);
    }

    public String getNombreUsuario() {
        return nombre;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombre = nombreUsuario;
    }

    public void setTiempoDeAnticipacion(int tiempoDeAnticipacion) {
        this.tiempoDeAnticipacion = new Integer(tiempoDeAnticipacion);
    }

    public List<Evento> obtenerEventosConSugerenciaAceptada() {
        return calendario.obtenerEventos().stream().filter(ev -> ev.tieneAtuendoAceptado() && ev.obtenerSugerencias().size() > 0).sorted(Comparator.comparing(Evento::getFecha)).collect(Collectors.toList());
    }

    public List<Evento> obtenerEventosSinSugerenciaAceptada() {
        return calendario.obtenerEventos().stream().filter(ev -> !ev.tieneAtuendoAceptado() && ev.obtenerSugerencias().size() > 0).sorted(Comparator.comparing(Evento::getFecha)).collect(Collectors.toList());
    }

    public Guardarropa buscarGuardarropaPorId(String id){
        List<Guardarropa> guardarropaEncontrados = guardarropas.stream()
                .filter(guardarropa -> guardarropa.getId()== Integer.parseInt(id))
                .collect(Collectors.toList());
        if(guardarropaEncontrados.isEmpty()) {
            return null;
        }
        else {
            return guardarropaEncontrados.get(0);
        }
    }


    public Guardarropa verificarSiIdDeGuardarropa(String id) {
        return this.guardarropas.stream()
                .filter(guardarropaAux->Integer.parseInt(id)==guardarropaAux.getId())
                .findAny()
                .orElseThrow(()->new NoExisteGuardarropaException("El id Guardarropa no exite en el usuario"));
    }
}
