package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public abstract class Contrato {
	private LocalDate fechaInicio;
	private LocalDate fechaFinal;
	
	public int getDuracion() {
		if (this.isActive()) {
			return (int) ChronoUnit.YEARS.between(fechaInicio, LocalDate.now());
		} else return (int) ChronoUnit.YEARS.between(fechaInicio, fechaFinal);
	}
	
	public abstract double getBasico(boolean Hijo, boolean Conyuge);
	
	public void finContrato() {
		this.setFechaFinal(LocalDate.now());
	}
	
	public void setFechaFinal(LocalDate fecha) {
		this.fechaFinal= fecha;
	}
	
	
	public boolean isActive() {
		return (fechaFinal.isAfter(LocalDate.now()))? true : false;
	}
	
	public Contrato(LocalDate fechaInicio, LocalDate fechaFinal) {
		this.fechaFinal = fechaFinal;
		this.fechaInicio = fechaInicio;
	}
	
	public LocalDate getFechaFinal() {
		return fechaFinal;
	}
	
public void setFechaInicio(LocalDate fechaInicio) {
	this.fechaInicio = fechaInicio;
}
	
}
