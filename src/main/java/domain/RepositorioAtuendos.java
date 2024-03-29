package domain;

import domain.usuario.Evento;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;
import java.util.stream.Collectors;

import static server.Main.em;

public class RepositorioAtuendos {
    private static RepositorioAtuendos instanceOfRepositorioAtuendos;
    private List<Atuendo> atuendos;

    public static RepositorioAtuendos getInstance() {
        if(instanceOfRepositorioAtuendos==null) {
            instanceOfRepositorioAtuendos = new RepositorioAtuendos();
        }
        return instanceOfRepositorioAtuendos;
    }

    private RepositorioAtuendos() {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/
        Query query = em.createQuery("select a from Atuendo a"); //levantamos la lista de usuarios de la BBDD
        atuendos = query.getResultList();
        /*manager.close();
        emf.close();*/
    }

    public Atuendo obtenerPorId(Long id) {
        List<Atuendo> atuendosEncontrados = atuendos.stream().filter(atuendo -> atuendo.getId() == id).collect(Collectors.toList());
        if(atuendosEncontrados.isEmpty()) {
            return null;
        }
        else {
            return atuendosEncontrados.get(0);
        }
    }

    public void actualizarAtuendo(Atuendo atuendo) {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/

        try {
            em.getTransaction().begin();
            em.merge(atuendo);
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
