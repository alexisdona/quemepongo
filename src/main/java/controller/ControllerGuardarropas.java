package controller;

import domain.*;
import domain.prenda.Color;
import domain.prenda.Material;
import domain.prenda.TipoDePrenda;
import domain.prenda.Trama;
import domain.usuario.Calendario;
import domain.usuario.Evento;
import domain.usuario.Periodo;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static server.Main.em;

public class ControllerGuardarropas {


    public ModelAndView mostrarGuardarropas(Request req, Response res) {
        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));
        return new ModelAndView(usuario.getGuardarropas(), "guardarropas.hbs");
    }

    public ModelAndView mostrarPrendas(Request req, Response res) {
        Guardarropa guardarropa = em.find(Guardarropa.class, Long.valueOf(req.params("id")));
        em.refresh(guardarropa);
        Map<String,Object > model = new HashMap<>();

        model.put("error", Boolean.valueOf(req.queryParams("error")));
        model.put("mensajeError", req.queryParams("mensajeError"));
        model.put("guardarropa", guardarropa);
        return new ModelAndView(model, "prendas.hbs");
    }

}
