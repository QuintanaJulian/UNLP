package Ejercicio.Ejercicio16;
import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;
import java.util.stream.Collectors;

public class User {
	private String nombre;
	private int DNI;
	private String direccion;
	
	private List<Propiedad> propiedades;
	private List<Reserva> reservas;
	
	public User(String nombre, int DNI, String direccion) {
		this.nombre= nombre;
		this.DNI= DNI;
		this.direccion= direccion;
		propiedades = new ArrayList<>();
		reservas = new ArrayList<>();
	}
	
	
	public void agregarPropiedad(Propiedad propiedad) {
		propiedades.add(propiedad);
	}
	
	
	public void reservarPropiedad(Reserva reserva) {
		reservas.add(reserva);
	}
	
	public List<Propiedad> getPropiedadesDisponibles(LocalDate inicio, LocalDate fin){
		return propiedades.stream().filter(prop -> prop.propiedadDisponible(inicio, fin)).collect(Collectors.toList());
	}
	
	public boolean eliminarReserva (Reserva reserva) {
		return reservas.remove(reserva);
	}
	
	public String getDireccion() {
		return direccion;
	}
	public int getDNI() {
		return DNI;
	}
	public String getNombre() {
		return nombre;
	}
	public List<Propiedad> getPropiedades() {
		return propiedades;
	}
	public List<Reserva> getReservas() {
		return reservas;
	}
	
}
