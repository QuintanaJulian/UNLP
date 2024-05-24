package Ejercicio.Ejercicio16;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Propiedad {
	private String nombre;
	private String descripcion;
	private double precioDia;
	private String direccion;
	
	private User dueno;
	private List<Reserva> reservas;
	
	
	
	
	
	public Propiedad(String nombre,String descripcion, double precioDia, String direccion, User dueno) {
		this.nombre=nombre;
		this.descripcion=descripcion;
		this.precioDia=precioDia;
		this.direccion=direccion;
		this.dueno=dueno;
		reservas = new ArrayList<>();
	}
	
	public boolean propiedadDisponible (LocalDate inicio, LocalDate fin) {
		return reservas.stream().anyMatch(res -> !res.overlapsDate(inicio, fin));
	}
	
	public boolean agregarReserva (LocalDate desde, LocalDate hasta, User user) {
		if (this.propiedadDisponible(desde, hasta)) {
			Reserva reserva = new Reserva(desde, hasta, this, user);
			reservas.add(reserva);
			return true;
		} else {
			return false;
		}	
	}
	
	public double getIngresos() {
		return reservas.stream().mapToDouble(res -> res.getPrecio()).sum();
	}
	
	public boolean eliminarReserva (Reserva reserva) {
		return reservas.remove(reserva);
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	public String getDireccion() {
		return direccion;
	}
	public User getDueno() {
		return dueno;
	}
	public String getNombre() {
		return nombre;
	}
	public double getPrecioDia() {
		return precioDia;
	}
	public List<Reserva> getReservas() {
		return reservas;
	}
	
}
