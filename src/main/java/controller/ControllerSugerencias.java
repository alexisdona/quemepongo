package controller;

import domain.Atuendo;
import domain.RepositorioAtuendos;
import domain.RepositorioDeUsuarios;
import domain.Usuario;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ControllerSugerencias {
    public ModelAndView mostrar(Request req, Response res) {
        Map<String, Object> model = new HashMap<>();
        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));
        model.put("eventos", usuario.obtenerEventosConSugerenciaAceptada());
        model.put("redirect", Boolean.valueOf(req.queryParams("redirect")));

        return new ModelAndView(model, "sugerenciasCalificadas.hbs");
    }
    public ModelAndView mostrarCalificacion(Request req, Response res) {
        Map<String, Object> model = new HashMap<>();
        Atuendo atuendo = RepositorioAtuendos.getInstance().obtenerPorId(Long.valueOf(req.params("id")));
        model.put("sugerencia", atuendo);
        model.put("sugerenciaId", atuendo.getId());
        return new ModelAndView(model, "calificarSugerencia.hbs");
    }
    public ModelAndView calificar(Request req, Response res) {
        // redirect a /sugerencias
        Atuendo atuendo = RepositorioAtuendos.getInstance().obtenerPorId(Long.valueOf(req.params("id")));
        atuendo.calificar(Integer.valueOf(req.queryParams("puntuacion")));
        RepositorioAtuendos.getInstance().actualizarAtuendo(atuendo);
        res.redirect("/sugerencias?redirect=true");
        return null;
    }
}
