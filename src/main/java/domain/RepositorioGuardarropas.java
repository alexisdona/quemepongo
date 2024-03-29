package domain;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

import static server.Main.em;

public class RepositorioGuardarropas {

    private static RepositorioGuardarropas instanceOfRepositorioDeGuardarropas;
    List<Guardarropa> guardarropas;

    public static RepositorioGuardarropas getInstance() {
        if(instanceOfRepositorioDeGuardarropas==null) {
            instanceOfRepositorioDeGuardarropas = new RepositorioGuardarropas();
        }
        return instanceOfRepositorioDeGuardarropas;
    }

    private RepositorioGuardarropas() {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/
        Query query = em.createQuery("select a from Guardarropa a"); //levantamos la lista de usuarios de la BBDD
        guardarropas = query.getResultList();
        /*manager.close();
        emf.close();*/

    }
}
