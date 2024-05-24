package ar.edu.unlp.objetos.uno.parcial5_11_22;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public abstract class Personal implements Bien {
	private String patente;
	private LocalDate fechaFabricacion;
	private double valor;
	
	public int getAntiguedad() {
		return (int) ChronoUnit.YEARS.between(this.getFechaFabricacion(), LocalDate.now());
	}
	
	public Personal (String patente, LocalDate fechaFabricacion, double valor) {
		this.patente= patente;
		this.fechaFabricacion= fechaFabricacion;
		this.valor= valor;
	}
	
	public String getPatente() {
		return this.patente;
	}
	public LocalDate getFechaFabricacion() {
		return fechaFabricacion;
	}
	public double getPrecio() {
		return valor;
	}
	
	public double getImpuesto() {
		if (this.getAntiguedad() > 10) {
			return 0;
		} else {
			return this.getImpuestoMenor10Anos();
		}
	}
	
	public abstract double getImpuestoMenor10Anos();
	
	//puede que necesite la implementaciobn abstracta de la clase implementada
	
}
