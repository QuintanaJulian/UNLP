package ar.edu.unlp.objetos.uno.parcial5_11_22;

import java.time.LocalDate;

public class Embarcacion extends Personal{
	private String nombre;
	
	@Override
	public double getImpuestoMenor10Anos() {
		if (this.getPrecio() < 1000000 ) {
			return this.getPrecio() * 0.1;
		} else return this.getPrecio() * 0.15;
	}
	
	public Embarcacion (String nombre, String patente, LocalDate fechaFabricacion, double valor) {
		super(patente, fechaFabricacion, valor);
		this.nombre= nombre;
	}
}
