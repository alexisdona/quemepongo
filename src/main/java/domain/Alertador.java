package domain;

import domain.clima.Alerta;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Alertador {

    private static Alertador instanceOfAlertador;

    public static Alertador getInstance() {
        if(instanceOfAlertador==null) {
            instanceOfAlertador = new Alertador();
        }
        return instanceOfAlertador;
    }

    public void alertarQueVaALLoverOGranizar(List<Alerta> alertas) {
        List<Usuario> usuariosConEventoHoy = RepositorioDeUsuarios.getInstance().getUsuarios().stream()
            .filter(usuario -> usuario.obtenerAtuendosSugeridosProximoEvento().getEvento().esHoy())
            .collect(Collectors.toList());
        usuariosConEventoHoy.forEach(usuario -> usuario.recibirAlertas(alertas));
    }

    public void avisarQueEstanListasLasSugerencias() {
        List<Usuario> usuariosParaAvisar = RepositorioDeUsuarios.getInstance().getUsuarios().stream()
                .filter(usuario -> usuario.quiereSerNotificado() && usuario.sugerenciasListasParaProximoEvento())
                .collect(Collectors.toList());
        for(Usuario usuario : usuariosParaAvisar) {
            Atuendo primeraSugerencia = usuario.getCalendario().obtenerProximoEvento().obtenerSugerencias().get(0);
            String prendas = this.obtenerPrendas(primeraSugerencia);
            usuario.notificar("Sugerencias Listas para Evento: "
                                + usuario.getCalendario().obtenerProximoEvento().getNombre()
                                + " en " + usuario.getCalendario().obtenerProximoEvento().getUbicacion()
                                + "\nMejor sugerencia: " + prendas);
        }
    }

    private String obtenerPrendas(Atuendo primeraSugerencia) {
        List<Prenda> prendas = new ArrayList<>();
        if(!primeraSugerencia.getPrendasSuperiores().isEmpty())
            prendas.addAll(primeraSugerencia.getPrendasSuperiores());
        if(primeraSugerencia.getPrendaInferior() != null)
            prendas.add(primeraSugerencia.getPrendaInferior());
        if(primeraSugerencia.getCalzado() != null)
            prendas.add(primeraSugerencia.getCalzado());
        if(primeraSugerencia.getAccesorio() != null)
            prendas.add(primeraSugerencia.getAccesorio());
        if(primeraSugerencia.getAccesorioCuello() != null)
            prendas.add(primeraSugerencia.getAccesorioCuello());
        if(primeraSugerencia.getAccesorioManos() != null)
            prendas.add(primeraSugerencia.getAccesorioManos());

        return prendas.stream().map(Prenda::getNombre).collect(Collectors.joining(", "));
    }

}
