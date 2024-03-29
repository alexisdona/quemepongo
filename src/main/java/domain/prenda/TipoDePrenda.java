package domain.prenda;

import exceptions.MaterialInvalidoException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static java.util.Objects.isNull;
import static java.util.Objects.requireNonNull;

@Entity
@Table(name = "tipo_prendas")
public class TipoDePrenda {

    @GeneratedValue
    @Id
    @Column(name = "tipo_prenda_id",columnDefinition = "int(11) NOT NULL")
    private long id;
    @Column(name = "temperatura_max")
    private double temperaturaMax;
    @Column(name = "temperatura_min")
    private double temperaturaMin;

    @Enumerated(EnumType.STRING)
    private Categoria categoria;

    @Column(name="nombre_tipo_prenda")
    private String nombreTipoPrenda;

    @ElementCollection(targetClass = Material.class, fetch = FetchType.LAZY)
    @JoinTable(name = "materiales_tipos_prendas", joinColumns = @JoinColumn(name = "tipo_prenda_id"))
    @Column(name = "material", nullable = false)
    @Enumerated(EnumType.STRING)

    private List<Material> materialesValidos = new ArrayList<>();

    public static final TipoDePrenda ZAPATO = new TipoDePrenda(Categoria.CALZADO, Arrays.asList(Material.CUERO), 35, -5,"Zapato");
    public static final TipoDePrenda REMERA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.SEDA, Material.ALGODON), 35, 20,"Remera");
    public static final TipoDePrenda REMERA_DEPORTIVA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.POLYESTER), 30, 20,"Remera deportiva");

    public static final TipoDePrenda BUZO = new TipoDePrenda(Categoria.PARTE_SUPERIOR_MEDIO, Arrays.asList(Material.ALGODON), 28, 0,"Buzo");
    public static final TipoDePrenda PANTALON = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), 30, -17,"Pantalón casual");
    public static final TipoDePrenda PANTALON_VESTIR = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), 30, 8,"Pantalón de vestir");
    public static final TipoDePrenda PANTALON_VERANO = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), 35, 18,"Pantalón de verano");
    public static final TipoDePrenda PANTALON_INVIERNO = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), -5, 18,"Pantalón de invierno");

    public static final TipoDePrenda COLLAR = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.ACERO), 0, 0, "Collar");
    public static final TipoDePrenda CROCS = new TipoDePrenda(Categoria.CALZADO, Arrays.asList(Material.GOMA), 35, 18,"Crocs");
    public static final TipoDePrenda BOTAS = new TipoDePrenda(Categoria.CALZADO, Arrays.asList(Material.CUERO), 22, 8,"Botas");
    public static final TipoDePrenda POLLERA = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), 35, 20,"Pollera");
    public static final TipoDePrenda SHORT = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.JEAN, Material.ALGODON), 35, 20,"Short");
    public static final TipoDePrenda BLUSA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.SEDA, Material.ALGODON), 15, 20,"Blusa");
    public static final TipoDePrenda MUSCULOSA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.ALGODON), 30, 20,"Musculosa");
    public static final TipoDePrenda REMERA_MANGA_LARGA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.SEDA, Material.ALGODON), 26, 18,"Remera manga larga");
    public static final TipoDePrenda ANTEOJOS = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.PLASTICO), 0, 0,"Anteojos");
    public static final TipoDePrenda PANUELO = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.ALGODON), 0, 0,"Pañuelo");
    public static final TipoDePrenda SIN_ACCESORIO = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.NINGUNO), 0, 0,"Sin accesorio");
    public static final TipoDePrenda MEDIAS = new TipoDePrenda(Categoria.ACCESORIO_PIES, Arrays.asList(Material.POLYESTER, Material.ALGODON), 30, 0,"Medias");
    public static final TipoDePrenda MEDIAS_TERMICAS = new TipoDePrenda(Categoria.ACCESORIO_PIES, Arrays.asList(Material.POLYESTER, Material.ALGODON), 0, -20,"Medias térmicas");

    public static final TipoDePrenda CAMPERA = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ARRIBA, Arrays.asList(Material.POLYESTER, Material.ALGODON), 20, 5,"Campera");
    public static final TipoDePrenda CANILLERA = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.PLASTICO, Material.GOMA), 0, 0,"Canillera");
    public static final TipoDePrenda BOTAS_NIEVE = new TipoDePrenda(Categoria.CALZADO, Arrays.asList(Material.ALGODON), 0, -30,"Botas de nieve");
    public static final TipoDePrenda ZAPATILLAS = new TipoDePrenda(Categoria.CALZADO, Arrays.asList(Material.POLYESTER), 30, 0,"Zapatilals");
    public static final TipoDePrenda NINGUNO_SUPERIOR = new TipoDePrenda(Categoria.PARTE_SUPERIOR_ABAJO, Arrays.asList(Material.NINGUNO), 50, 36,"Sin superior");
    public static final TipoDePrenda GUANTES = new TipoDePrenda(Categoria.ACCESORIO_MANOS, Arrays.asList(Material.LANA), 10, -5,"Guantes");
    public static final TipoDePrenda GORROABRIGO = new TipoDePrenda(Categoria.ACCESORIO_CABEZA, Arrays.asList(Material.LANA), 10, -10,"Gorro");
    public static final TipoDePrenda PARAGUAS = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.PLASTICO), 0, 0,"Paraguas");
    public static final TipoDePrenda CASCO = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.PLASTICO), 0, 0,"Casco");
    public static final TipoDePrenda BUFANDA = new TipoDePrenda(Categoria.ACCESORIO_CUELLO, Arrays.asList(Material.LANA), 10, -10,"Bufanda");
    public static final TipoDePrenda CHALINA = new TipoDePrenda(Categoria.ACCESORIO_CUELLO, Arrays.asList(Material.ALGODON), 15, 0,"Chalina");
    public static final TipoDePrenda MALLA = new TipoDePrenda(Categoria.PARTE_INFERIOR, Arrays.asList(Material.POLYESTER), 50, 27,"Malla");
    public static final TipoDePrenda ACCESORIO_VACIO_MANOS = new TipoDePrenda(Categoria.ACCESORIO_MANOS, Arrays.asList(Material.NINGUNO), 0, -50,"Sin accesorios manos");
    public static final TipoDePrenda ACCESORIO_VACIO_CUELLO = new TipoDePrenda(Categoria.ACCESORIO_CUELLO, Arrays.asList(Material.NINGUNO), 0, -50,"Sin accesorios cuello");
    public static final TipoDePrenda GORRO = new TipoDePrenda(Categoria.ACCESORIO, Arrays.asList(Material.LANA), 10, -10,"Gorra");

    public TipoDePrenda(){}

    public TipoDePrenda(Categoria categoria, List<Material> materialesValidos, double temperaturaMax, double temperaturaMin, String nombreTipoPrenda) {
        this.categoria = requireNonNull(categoria, "La categoría es obligatoria");
        this.materialesValidos = requireNonNull(materialesValidos, "Los materiales son obligatorios");
        this.temperaturaMax = temperaturaMax;
        this.temperaturaMin = temperaturaMin;
        this.nombreTipoPrenda = nombreTipoPrenda;
    }


    public double obtenerUnidadDeAbrigo() {
        double unidadDeAbrigo = 0.0;
        if (!isNull(this.temperaturaMin) && !isNull(this.temperaturaMax)) {
            unidadDeAbrigo = NivelAbrigo.getInstance().getNivelAbrigo(temperaturaMin, temperaturaMax);
        }
        return unidadDeAbrigo;
    }

    public Categoria obtenerCategoria() {
        return this.categoria;
    }

    public void validarMaterial(Material material) {
        if (!materialesValidos.contains(material)) {
            throw new MaterialInvalidoException("El material no es permitido en el tipo de prenda");
        }
    }

    public List<Material> obtenerMaterialesValidos() {
        return materialesValidos;
    }

    public long getId() {
        return id;
    }

    public String getNombreTipoPrenda() {
        return nombreTipoPrenda + " - Categoria: " + this.obtenerCategoria().toString() + " - Max: " + this.temperaturaMax + " - Min: " + this.temperaturaMin;
    }

    public void setNombreTipoPrenda(String nombreTipoPrenda) {
        this.nombreTipoPrenda = nombreTipoPrenda;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TipoDePrenda tipoDePrenda = (TipoDePrenda) o;
        return categoria == tipoDePrenda.obtenerCategoria() &&
                materialesValidos.equals(tipoDePrenda.obtenerMaterialesValidos());
    }

}
