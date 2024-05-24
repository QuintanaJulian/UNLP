package Ejercicio.Ejercicio16;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import ar.edu.unlp.objetos.uno.Ejercicio14.DateLapse2;

public class Reserva {
	//private LocalDate desde;
	//private LocalDate hasta;
	private Propiedad propiedad;
	private User inquilino;
	//private int dias;
	private DateLapse2 estadia;
	
	
	public Reserva(LocalDate desde, LocalDate hasta, Propiedad propiedad, User inquilino) {
		//this.desde=desde;
		//this.hasta=hasta;
		this.propiedad=propiedad;
		this.inquilino=inquilino;
		estadia = new DateLapse2(desde, hasta);
		//this.dias= (int) desde.until(hasta, ChronoUnit.DAYS);
	}
	
	public LocalDate getDesde() {
		return estadia.getFrom();
	}
	public LocalDate getHasta() {
		return estadia.getTo();
	}
	public int getDias() {
		return estadia.getSizeInDays();
	}
	
	public double getPrecio() {
		return estadia.getSizeInDays() * propiedad.getPrecioDia();
	}
	
	public boolean overlapsDate (LocalDate desde, LocalDate hasta) {
		DateLapse2 rango= new DateLapse2(desde, hasta);
		return estadia.overlapsDate(rango);
	}
	
	public User getInquilino() {
		return inquilino;
	}
	public Propiedad getPropiedad() {
		return propiedad;
	}
}
