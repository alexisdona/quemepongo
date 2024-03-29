package controller;

import domain.*;
import domain.usuario.Evento;
import domain.usuario.Periodo;
import org.springframework.cglib.core.Local;
import spark.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

import static server.Main.em;

public class ControllerEventos {

    public ModelAndView mostrarSugerencia(Request req, Response res) {
        Map<String, Object> model = new HashMap<>();
        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));
        Evento evento = usuario.obtenerEvento(Long.valueOf(req.params("id")));

        int indice = Integer.valueOf(req.params("indice"));

        List<Atuendo> sugerencias = evento.obtenerSugerenciasSinEstado();

        model.put("sugerencia", sugerencias.get(indice));
        model.put("nombreEvento", evento.getNombre());
        model.put("eventoId", req.params(":id"));
        model.put("noHayMasSugerencias", sugerencias.size() == (indice + 1));
        model.put("indice", indice);
        return new ModelAndView(model, "sugerencias.hbs");
    }

    public ModelAndView mostrarEventos(Request req, Response res) {
        Map<String, Object> model = new HashMap<>();
        try {
            Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));
            model.put("redirectSugerencias", Boolean.valueOf(req.queryParams("redirectSugerencias")));
            model.put("eventosSinAceptar", usuario.obtenerEventosSinSugerenciaAceptada());
            model.put("eventosAceptados", usuario.obtenerEventosConSugerenciaAceptada());

            return new ModelAndView(model, "eventos.hbs");
        } catch (Exception e) {
            model.put("error", e.getMessage());
            return new ModelAndView(model, "eventos.hbs");
        }
    }

    public ModelAndView modificarEstadoSugerencia(Request req, Response res) {
        // obtener con el id el atuendo y hacer aceptar o rechazar
        Evento evento = RepositorioEventos.getInstance().findById(Long.valueOf(req.params(":id")));

        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager em = emf.createEntityManager();*/

        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));

        int indice = Integer.valueOf(req.queryParams("indice"));

        List<Atuendo> sugerencias = evento.obtenerSugerencias();

        Atuendo atuendo = sugerencias.stream().filter(a -> a.getId() == Long.valueOf(req.params(":idSugerencia")))
        .collect(Collectors.toList()).get(0);
//        Atuendo atuendo = em.find(Atuendo.class,Long.valueOf(req.params(":idSugerencia")));

        if ((indice + 1) == sugerencias.size()) {
            usuario.aceptarAtuendo(atuendo);
            this.actualizarUsuarioYAtuendo(usuario, atuendo);

            res.redirect("/eventos?redirectSugerencias=true");

        } else {
            String estadoElegido = req.queryParams("estado");
            if(estadoElegido.equals("Aceptar")) {
                usuario.aceptarAtuendo(atuendo);
                this.actualizarUsuarioYAtuendo(usuario, atuendo);

                res.redirect("/eventos?redirectSugerencias=true");
            } else if (estadoElegido.equals("Rechazar")) {
                usuario.rechazarAtuendo(atuendo);
                this.actualizarUsuarioYAtuendo(usuario, atuendo);

                res.redirect("/eventos/"+req.params("id")+"/sugerencias/"+ String.valueOf(indice + 1));
            }
        }
        return null;
    }

    private void actualizarUsuarioYAtuendo(Usuario usuario, Atuendo atuendo) {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/

        try {
            em.getTransaction().begin();
            em.merge(usuario);
            em.merge(atuendo);
            em.getTransaction().commit();
        }
        catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        finally {

        }
    }

    public ModelAndView mostrar(Request req, Response res) {
        return new ModelAndView(null, "altaEvento.hbs");
    }

    public ModelAndView crearEvento(Request req, Response res) {
        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));
        String nombre = req.queryParams("descripcion");
        String ubicacion = req.queryParams("ubicacion");
        String fechaString = req.queryParams("fecha");

        DateTimeFormatter formato = DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a");
        LocalDateTime fecha = LocalDateTime.parse(fechaString, formato);

        Evento eventoAAgregar = new Evento(nombre, ubicacion, fecha, Periodo.NINGUNO, 0);
        usuario.getCalendario().agregarEvento(eventoAAgregar);
        this.actualizarUsuarioYEvento(usuario);

        res.redirect("/calendario/" + LocalDate.now().getYear() + "/" + LocalDate.now().getMonth().getValue());
        return null;
    }

    private void actualizarUsuarioYEvento(Usuario usuario) {
        /*EntityManagerFactory emf = Persistence.createEntityManagerFactory("xdnbowkup2bzy501");
        EntityManager manager = emf.createEntityManager();*/

        try {
            em.getTransaction().begin();
            em.merge(usuario);
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
