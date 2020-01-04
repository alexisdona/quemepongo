package domain;

import domain.usuario.Evento;
import domain.usuario.Periodo;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDateTime;

import static server.Main.em;

public class RepositorioEventos {
    private static RepositorioEventos instanceOfRepositorioEventos;

    public static RepositorioEventos getInstance() {
        if(instanceOfRepositorioEventos==null) {
            instanceOfRepositorioEventos = new RepositorioEventos();
        }
        return instanceOfRepositorioEventos;
    }

    public Evento findById(long id) {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager em = emf.createEntityManager();*/
        return em.find(Evento.class,Long.valueOf(id));
    }

    public void actualizarEvento(Evento evento) {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/

        try {
            em.getTransaction().begin();
            em.merge(evento);
            em.getTransaction().commit();
        }
        catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        finally {
            //manager.close();
        }
    }

}
