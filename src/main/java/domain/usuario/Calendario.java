package domain.usuario;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;


public class Calendario {

    long id;

    String nombre;

    List<Evento> eventos = new ArrayList<>();

    public Calendario() {}

    public Calendario(List<Evento> eventos) {
        this.eventos = eventos;
    }

    public void agregarEvento(Evento evento) {
        eventos.add(evento);
    }

    public List<Evento> obtenerEventosDelMes(int anio, int mes) {
        return eventos.stream()
                .filter(evento -> evento.getFecha().toLocalDate().getMonth().getValue() == mes
                                && evento.getFecha().toLocalDate().getYear() == anio)
                .collect(Collectors.toList());
    }

    public List<Evento> obtenerEventosPorFecha(LocalDate fecha) {
        return eventos.stream().filter(evento -> evento.getFecha().toLocalDate().isEqual(fecha)).collect(Collectors.toList());
    }

    public Evento obtenerProximoEvento() {
        if(!eventos.isEmpty()) {
            List<Evento> eventosFiltrados = eventos.stream().filter(evento -> evento.getFecha().isAfter(LocalDateTime.now()) && evento.obtenerSugerencias().size() == 0).collect(Collectors.toList());
            if(!eventosFiltrados.isEmpty()) {
                eventosFiltrados.sort(Comparator.comparing(Evento::getFecha));
                return eventosFiltrados.get(0);
            } else {
                return new Evento("","", LocalDateTime.now().plusDays(-5),Periodo.NINGUNO,0);
            }
        } else {
            return new Evento("","", LocalDateTime.now().plusDays(-5),Periodo.NINGUNO,0);
        }
    }

    public List<Evento> eventosProximos(){
        return eventos.stream().filter(evento -> evento.esProximo()).collect(Collectors.toList());
    }

    public List<Evento> obtenerEventos() {
        return eventos;
    }

    public List<Evento> obtenerEventosEntreFechas(LocalDate fechaDesde, LocalDate fechaHasta) {
        return eventos.stream().filter((evento) -> evento.getFecha().toLocalDate().isAfter(fechaDesde) && evento.getFecha().toLocalDate().isBefore(fechaHasta)).collect(Collectors.toList());
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
