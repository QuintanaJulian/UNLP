package Ejercicio.Ejercicio21;

import java.util.List;

public class Auto {
	private String descripcion;
	private int capacidad;
	private int modelo;
	private double valor;
	private Conductor conductor;
	private List<Viaje> viajes;
	
	public void nuevoViaje () {
		
	}
	
	
	public List<Viaje> getViajesManana(){
		
	}
	
	public void setConductor(Conductor conductor) {
		this.conductor = conductor;
	}
	
	public List<Viaje> getViajes() {
		return viajes;
	}
	
	public int getModelo() {
		return modelo;
	}
}
