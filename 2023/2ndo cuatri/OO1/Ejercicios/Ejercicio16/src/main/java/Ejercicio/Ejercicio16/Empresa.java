package Ejercicio.Ejercicio16;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

public class Empresa {
	
//	private List<Propiedad> propiedades;
	private List<User> usuarios;
	
	public Empresa() {
		usuarios= new ArrayList<>();
	}
	
	
	
	public User nuevoUsuario(String nombre, int DNI, String direccion) {
		User u = new User (nombre, DNI, direccion);
		usuarios.add(u);
		return u;
	}
	public Propiedad nuevaPropiedad(String nombre,String descripcion, double precioDia, String direccion, User dueno) {
		Propiedad propiedad= new Propiedad(nombre, descripcion, precioDia, direccion, dueno);
	//	propiedades.add(propiedad);
		dueno.agregarPropiedad(propiedad);
		return propiedad;
	}
	
	public List<Propiedad> buscarDisponibles(LocalDate inicio, LocalDate fin){
		//List<Propiedad> disponibles= propiedades.stream().filter(prop -> prop.propiedadDisponible(inicio, fin)).collect(Collectors.toList());
		//return disponibles;
		return usuarios.stream().flatMap(user -> user.getPropiedadesDisponibles(inicio, fin).stream()).collect(Collectors.toList()) ;
	}
	
	public boolean hacerReserva(Propiedad propiedad, LocalDate desde, LocalDate hasta, User user) {
		/*if (propiedad.propiedadDisponible(desde, hasta)) {
			propiedad.agregarReserva(desde, hasta, user);
			return true;
		}
		return false;*/
		return propiedad.agregarReserva(desde, hasta, user);
	}
	
	public double calcularReserva(Reserva reserva) {
		return reserva.getPrecio();
	}
	
	public boolean eliminarReserva (Reserva reserva) {
		if (reserva.getDesde().isAfter(LocalDate.now())) {
			reserva.getInquilino().eliminarReserva(reserva);
			reserva.getPropiedad().eliminarReserva(reserva);
			return true;
		}
		return false;
	}
	
	public List<Reserva> getReservaUser(User usuario){
		return usuario.getReservas();
	}
	
	
	public double getIngresosUser(User usuario) {
		return usuario.getPropiedades().stream().mapToDouble(prop -> prop.getIngresos()).sum();
		
	}
	
	public List<Propiedad> getPropiedades() {
		//return propiedades;
		return usuarios.stream().flatMap(u -> u.getPropiedades().stream()).collect(Collectors.toList());
	}
	public List<User> getUsuarios() {
		return usuarios;
	}
}
