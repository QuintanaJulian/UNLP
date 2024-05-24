package Ejercicio.Ejercicio21;

import java.util.List;

public class Sistema {
	private List<Auto> autos;
	private List<Pasajero> pasajeros;
	
	public Conductor AltaUsuarioConductor(String nombre, Auto auto) {
		Conductor conductor = new Conductor(nombre, auto);
		auto.setConductor(conductor);
		return conductor;
	}
	
	public Pasajero altaUsuarioPasajero(String nombre) {
		Pasajero pasajero = new Pasajero(nombre);
		pasajeros.add(pasajero);
		return pasajero;
	}
	
	public void cargarSaldo (Usuario user, double monto) {
		user.cargarSaldo(monto);
	}
}
