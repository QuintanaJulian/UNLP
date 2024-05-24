package Ejercicio.Ejercicio21;

import java.time.LocalDate;
import java.util.List;

public class Viaje {
	private String origen;
	private String destino;
	private double costo;
	private LocalDate fecha;
	private List<Usuario> pasajeros;
	
	public boolean agregarPasajero() {
		
		return false;
	}
	
	public boolean esManana() {
		return LocalDate.now().isAfter(fecha.minusDays(1));
	}
	

}
