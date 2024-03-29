package domain;
import domain.estadoAtuendo.*;


import domain.prenda.Categoria;
import domain.prenda.TipoDePrenda;
import exceptions.PrendaInvalidaException;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import static domain.prenda.Categoria.*;

@Entity
@Table(name = "atuendos")
public class Atuendo {

    @GeneratedValue
    @Id
    @Column(name = "atuendo_id",columnDefinition = "int(11) NOT NULL")
    long id;

   private String nombre;

    @ManyToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "prendas_atuendos",joinColumns = @JoinColumn(name="atuendo_id"),inverseJoinColumns = @JoinColumn(name = "prenda_id"))
    private Set<Prenda> prendasSuperiores = new HashSet<>();


    @ManyToOne (cascade = {CascadeType.ALL,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "accesorio_id", columnDefinition = "int(11) NOT NULL")
    private Prenda accesorio;

    @ManyToOne (cascade = {CascadeType.ALL,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "prenda_inferior_id",columnDefinition = "int(11) NOT NULL")
    private Prenda prendaInferior;

    @ManyToOne (cascade = {CascadeType.ALL,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "calzado_id", columnDefinition = "int(11) NOT NULL")
    private Prenda calzado;

    @ManyToOne (cascade = {CascadeType.ALL,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "cuello_id", columnDefinition = "int(11) NOT NULL")
    private Prenda accesorioCuello;

    @ManyToOne (cascade = {CascadeType.ALL,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "manos_id", columnDefinition = "int(11) NOT NULL")
    private Prenda accesorioManos;

    @Transient
    private EstadoAtuendo estado ;


    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private EstadosAtuendo estadoAtuendo = EstadosAtuendo.NUEVO;

    private Integer calificacion;

    @PostLoad
    public void onPostLoad() {
        if (this.estadoAtuendo == null) {
            this.estadoAtuendo = EstadosAtuendo.NUEVO;
        }
        switch(this.estadoAtuendo) {
            case NUEVO:
                this.estado = new Nuevo(this);
                break;
            case ACEPTADO:
                this.estado = new Aceptado(this);
                break;
            case RECHAZADO:
                this.estado = new Rechazado(this);
                break;
            case CALIFICADO:
                this.estado = new Calificado(this, this.calificacion);
                break;
            default:
                this.estado = new Nuevo(this);
                break;
        }
    }

    public Atuendo() {}

    public Atuendo(Set<Prenda> prendasSuperiores, Prenda prendaInferior, Prenda calzado, Prenda accesorio, Prenda accesorioCuello, Prenda accesorioManos) {
        this.validarPrenda(prendasSuperiores, prendaInferior, calzado, accesorio, accesorioCuello, accesorioManos);
        this.accesorio = accesorio;
        this.prendasSuperiores = prendasSuperiores;
        this.prendaInferior = prendaInferior;
        this.calzado = calzado;
        this.accesorioCuello = accesorioCuello;
        this.accesorioManos = accesorioManos;
        this.estado = new Nuevo(this); //el atuendo nace en estado nuevo.
        this.estadoAtuendo = EstadosAtuendo.NUEVO;
        this.setearAtuendoEnPrendasSuperiores();
    }


    private void setearAtuendoEnPrendasSuperiores() {
        this.prendasSuperiores.forEach(prenda -> prenda.setAtuendo(this));
        this.prendaInferior.setAtuendo(this);
        this.calzado.setAtuendo(this);
        if (this.accesorio!= null) {
            this.accesorio.setAtuendo(this);
        }
        if (this.accesorio!= null) {
            this.accesorioCuello.setAtuendo(this);
        }
        if (this.accesorio!= null) {
            this.accesorioManos.setAtuendo(this);
        }
    }

    public boolean getFueCalificado() {
        return this.estaCalificado();
    }

    public int getPuntuacion() {
        return this.calificacion;
    }

    private void validarPrenda(Set<Prenda> prendasSuperiores, Prenda prendaInferior,
                               Prenda calzado, Prenda accesorio, Prenda accesorioCuello, Prenda accesorioManos) {
        String mensajeDeError = "";
        mensajeDeError = mensajeDeError.concat(validarPrendas(PARTE_SUPERIOR, prendasSuperiores));

        mensajeDeError = mensajeDeError.concat(validarPrenda(PARTE_INFERIOR, prendaInferior));

        mensajeDeError = mensajeDeError.concat(validarPrenda(CALZADO, calzado));

        mensajeDeError = mensajeDeError.concat(validarPrenda(ACCESORIO, accesorio));

        mensajeDeError = mensajeDeError.concat(validarPrenda(ACCESORIO_CUELLO, accesorioCuello));

        mensajeDeError = mensajeDeError.concat(validarPrenda(ACCESORIO_MANOS, accesorioManos));

        if (mensajeDeError != "") {
            throw new PrendaInvalidaException(mensajeDeError);
        }
    }

    private String validarPrendas(Categoria categoria, Set<Prenda> prendas) {
        String mensajeDeError = "";
        if (prendas.stream().anyMatch(prenda -> prenda.obtenerCategoria() != categoria)) {
            switch (categoria) {
                case PARTE_SUPERIOR:
                    if (prendas.stream().anyMatch(prenda -> !prenda.esParteSuperior())) {
                        mensajeDeError = "Una/s de las prendas superiores no es válida. ";
                    }
                    break;
            }
        }
        return mensajeDeError;
    }

    private String validarPrenda(Categoria categoria, Prenda prenda) {
        String mensajeDeError = "";
        if (prenda.obtenerCategoria() != categoria) {
            String tipoPrenda = "";
            switch (categoria) {
                case PARTE_INFERIOR:
                    tipoPrenda = "prenda inferior";
                    break;
                case PARTE_SUPERIOR:
                    tipoPrenda = "prenda superior";
                    break;
                case CALZADO:
                    tipoPrenda = "prenda de tipo calzado";
                    break;
                case ACCESORIO:
                    if (prenda.esAccesorioGeneral()) {
                        break;
                    }
                    tipoPrenda = "prenda accesorio";
                    break;
                case ACCESORIO_CUELLO:
                    tipoPrenda = "prenda accesorio cuello";
                    break;
                case ACCESORIO_MANOS:
                    tipoPrenda = "prenda accesorio manos";
                    break;

            }
            mensajeDeError = mensajeDeError.concat("La " + tipoPrenda + " no es válida. ");
        }
        return mensajeDeError;
    }

    public Set<Prenda> obtenerPrendasSuperiores() {
        return prendasSuperiores;
    }

    public Prenda obtenerPrendaInferior() {
        return prendaInferior;
    }

    public Prenda obtenerAccesorio() {
        return accesorio;
    }

    public Prenda obtenerCalzado() {
        return calzado;
    }

    public Prenda obtenerAccesorioCuello() {
        return accesorioCuello;
    }

    public Prenda obtenerAccesorioManos() {
        return accesorioManos;
    }

    public Set<Prenda> getPrendasSuperiores() {
        return prendasSuperiores;
    }

    public Prenda getPrendaInferior() {
        return prendaInferior;
    }

    public Prenda getAccesorio() {
        return accesorio;
    }

    public Prenda getCalzado() {
        return calzado;
    }

    public Prenda getAccesorioCuello() {
        return accesorioCuello;
    }

    public Prenda getAccesorioManos() {
        return accesorioManos;
    }

    public EstadoAtuendo obtenerEstadoAtuendo() { return this.estado; }

    public int obtenerCalificacionAnterior() {return this.estado.obtenerCalificacionAnterior();}

    public int obtenerCalificacionActual() {return this.estado.obtenerCalificacionActual();}

    public void aceptar() {
        this.estado.aceptar();
        this.estadoAtuendo = EstadosAtuendo.ACEPTADO;
        this.cambiarDisponibilidadPrendas(false);
    }

    private void cambiarDisponibilidadPrendas(boolean nuevaDisponibilidad) {
        this.accesorio.setDisponibilidad(nuevaDisponibilidad);
        this.calzado.setDisponibilidad(nuevaDisponibilidad);
        this.prendaInferior.setDisponibilidad(nuevaDisponibilidad);
        this.accesorioManos.setDisponibilidad(nuevaDisponibilidad);
        this.accesorioCuello.setDisponibilidad(nuevaDisponibilidad);
        this.prendasSuperiores.forEach(prenda -> prenda.setDisponibilidad(nuevaDisponibilidad));
    }

    public void calificar(int nuevaCalificacion) {
        this.estado.calificar(nuevaCalificacion);
        this.estadoAtuendo = EstadosAtuendo.CALIFICADO;
        this.calificacion = nuevaCalificacion;
    }

    public void rechazar() {
        this.estado.rechazar();
        this.estadoAtuendo = EstadosAtuendo.RECHAZADO;
        this.cambiarDisponibilidadPrendas(true);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void cambiarEstado(EstadoAtuendo estado) {
        this.estado = estado;
    }

    public boolean estaCalificado() {
        return this.estado.estaCalificado();
    }

    public boolean esAptoParaLluvia() {
        return (this.accesorio.obtenerTipoDePrenda() == TipoDePrenda.PARAGUAS || this.accesorioManos.obtenerTipoDePrenda() == TipoDePrenda.PARAGUAS)
                || (this.prendasSuperiores.stream().anyMatch(prenda -> prenda.obtenerSiEsParaLluvia())
                && this.prendaInferior.obtenerSiEsParaLluvia()
                && this.calzado.obtenerSiEsParaLluvia()
                && this.accesorioCuello.obtenerSiEsParaLluvia()
                && this.accesorioManos.obtenerSiEsParaLluvia());
    }

    public long getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Atuendo atuendo = (Atuendo) o;
        return Objects.equals(accesorio, atuendo.obtenerAccesorio()) &&
                Objects.equals(prendasSuperiores, atuendo.obtenerPrendasSuperiores()) &&
                Objects.equals(prendaInferior, atuendo.obtenerPrendaInferior()) &&
                Objects.equals(calzado, atuendo.obtenerCalzado()) &&
                Objects.equals(estado, atuendo.obtenerEstadoAtuendo()) &&
                Objects.equals(accesorioCuello, atuendo.obtenerAccesorioCuello()) &&
                Objects.equals(accesorioManos, atuendo.obtenerAccesorioManos());
    }
}