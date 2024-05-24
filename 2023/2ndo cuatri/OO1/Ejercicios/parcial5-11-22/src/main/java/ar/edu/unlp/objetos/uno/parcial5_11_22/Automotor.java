package ar.edu.unlp.objetos.uno.parcial5_11_22;

import java.time.LocalDate;

public class Automotor extends Personal{
	private String marca;
	private String modelo;
	
	@Override
	public double getImpuestoMenor10Anos() {
		return this.getPrecio() * 0.05;
	}
	
	public Automotor (String marca, String modelo, String patente, LocalDate fechaFabricacion, double valor) {
		super(patente, fechaFabricacion, valor);
		this.marca= marca;
		this.modelo= modelo;
	}
	
	
}
