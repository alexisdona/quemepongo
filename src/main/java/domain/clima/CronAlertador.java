package domain.clima;

import domain.Alertador;
import domain.RepositorioDeUsuarios;
import domain.Usuario;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

//@Component
public class CronAlertador implements Job {

    /*@Scheduled(fixedDelay = 50000)
    public static void chequearCondicionClimatica() {
        System.out.println(new Date() + " Job ChequearCondicionClimatica iniciado");
        List<Alerta> alertas = AccuWeather.getInstance().obtenerAlertas();
        if(!alertas.isEmpty()) {
            Alertador.getInstance().alertarQueVaALLoverOGranizar(alertas);
        }
        System.out.println(new Date() + " Job ChequearCondicionClimatica finalizado");
    }*/

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        avisarQueEstanListasLasSugerencias();
    }

    //@Scheduled(fixedDelay = 5000)
    public static void avisarQueEstanListasLasSugerencias() {
        System.out.println(new Date() + " Job AvisarQueEstanListasLasSugerencias iniciado");

        List<Usuario> usuariosParaAvisar = RepositorioDeUsuarios.getInstance().getUsuarios();
        for(Usuario usuario : usuariosParaAvisar)
            usuario.generarSugerenciasParaProximoEvento();

        Alertador.getInstance().avisarQueEstanListasLasSugerencias();
        System.out.println(new Date() + " Job AvisarQueEstanListasLasSugerencias finalizado");
    }

}
