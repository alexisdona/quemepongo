package controller;

import domain.*;
import domain.prenda.*;
import net.sf.oval.internal.util.LinkedSet;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static server.Main.em;

public class ControllerAltaDePrenda {
    public ModelAndView mostrarAltaDePrenda(Request req, Response res) {
        Map<String,Object > model = new HashMap<>();
        List<TipoDePrenda> tipoDePrendas = RepositorioTipoDePrendas.getInstance().getTipoDePrendas();
        model.put("tipoDePrendas",tipoDePrendas);

        return new ModelAndView(model,"altaDePrenda.hbs");
    }


    public ModelAndView seleccionAltaDePrenda (Request req, Response res) {
        Usuario usuario = RepositorioDeUsuarios.getInstance().buscarUsuarioPorEmail(req.session().attribute("user"));

        Guardarropa guardarropa = em.find(Guardarropa.class, Long.valueOf(req.params("id")));

        Material material = obtenerMaterial(req.queryParams("material"));
        TipoDePrenda tipo = RepositorioTipoDePrendas.getInstance().buscar(req.queryParams("tipo_prenda"));

        String nombre = req.queryParams("nombre");
        Color colorPrimario = hexToRgb(req.queryParams("colorPrimario"));
        Color colorSegundario = hexToRgb(req.queryParams("colorSecundario"));
        Trama trama = obtenerTrama(req.queryParams("trama"));
        boolean impermeable = (req.queryParams("impermeable").equals("SI"))?true:false;

        Borrador borrador = new Borrador();
        try {
            borrador.definirTipo(tipo);
            borrador.definirMaterial(material);
            borrador.definirNombre(nombre);
            borrador.definirColorPrimario(colorPrimario);
            borrador.definirColorSecundario(colorSegundario);
            borrador.definirTrama(trama);
            borrador.definirEsParaLLuvia(impermeable);
            borrador.definirGuardarropa(guardarropa);
            Prenda nuevaPrenda = borrador.crearPrenda();
            em.getTransaction().begin();
            em.persist(nuevaPrenda);
            em.getTransaction().commit();
            usuario.buscarGuardarropaPorId(req.params("id")).guardarPrenda(nuevaPrenda);
            this.actualizarUsuarioYGuardarropa(usuario,usuario.buscarGuardarropaPorId(req.params("id")),nuevaPrenda);
            res.redirect("/guardarropas/"+req.params("id")+"/prendas");
        }
        catch (Exception e) {
            try {
                res.redirect("/guardarropas/"+req.params("id")+"/prendas?error=true&mensajeError="+ URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8.toString()));
            } catch(Exception e1) {
                res.redirect("/guardarropas/"+req.params("id")+"/prendas");
            }
        }

        return null;
    }


    private void actualizarUsuarioYGuardarropa(Usuario usuario, Guardarropa guardarropa,Prenda prenda) {
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

    public static Color hexToRgb(String colorStr) {
        return new Color(
                Integer.valueOf( colorStr.substring( 1, 3 ), 16 ),
                Integer.valueOf( colorStr.substring( 3, 5 ), 16 ),
                Integer.valueOf( colorStr.substring( 5, 7 ), 16 ) );
    }

    public Material obtenerMaterial(String material){
        if(material.equals("LANA"))
            return Material.LANA;
        if(material.equals("ALGODON"))
            return Material.ALGODON;
        if(material.equals("CUERO"))
            return Material.CUERO;
        if(material.equals("SEDA"))
            return Material.SEDA;
        if(material.equals("JEAN"))
            return Material.JEAN;
        if(material.equals("ACERO"))
            return Material.ACERO;
        if(material.equals("GOMA"))
            return Material.GOMA;
        if(material.equals("PLASTICO"))
            return Material.PLASTICO;
        if(material.equals("PLATA"))
            return Material.PLATA;
        if(material.equals("ORO"))
            return Material.ORO;
        if(material.equals("POLYESTER"))
            return Material.POLYESTER;
        if(material.equals("LYCRA"))
            return Material.LYCRA;
        if(material.equals("LINO"))
            return Material.LINO;
        else
            return Material.NINGUNO;
    }

    public Trama obtenerTrama(String trama){
        if(trama.equals("LISA"))
            return Trama.LISA;
        if(trama.equals("RAYADA"))
            return Trama.RAYADA;
        if(trama.equals("LUNARES"))
            return Trama.LUNARES;
        if(trama.equals("CUADROS"))
            return Trama.CUADROS;
        if(trama.equals("ESTAMPADO"))
            return Trama.ESTAMPADO;
        else
            return Trama.NINGUNO;
    }
}




