package ar.edu.unlp.objetos.uno.Ejercicio14;

import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse2 {
	private LocalDate from;
	private int sizeInDays;
	//private static final ChronoUnit DAYS

	public DateLapse2() {
		// TODO Auto-generated constructor stub
	}
	
	public DateLapse2(LocalDate from, LocalDate to) {
		this.from= from;
		this.setTo(to);		
	}
	
	public boolean setFrom (int ano, int mes, int dia) {
		try {
			from = LocalDate.of(ano, mes, dia);
			return true;
		} catch (DateTimeException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	
	public boolean setTo (int ano, int mes, int dia) {
		LocalDate to; 
		try {
			to = LocalDate.of(ano, mes, dia);
			sizeInDays = (int) from.until(to, ChronoUnit.DAYS);
			return true;
		} catch (DateTimeException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	
	public void setFrom (LocalDate fecha) {
		from = fecha;
	}
	
	public void setTo (LocalDate fecha) {
		sizeInDays = (int) from.until(fecha, ChronoUnit.DAYS);
	}
	
	
	
	public LocalDate getFrom() {
		return from;
	}
	
	public LocalDate getTo() {
		LocalDate to;
		to = from.plusDays(sizeInDays);
		return to;
	}
	
	public int getSizeInDays() {
		return sizeInDays;
	}

	
	public boolean includesDate (LocalDate other) {
		return from.isBefore(other) && this.getTo().isAfter(other);
	}
	
	public boolean overlapsDate (DateLapse2 other) {
//		return ((from.isAfter(other.getTo()) || this.getTo().isBefore(other.getFrom())));
		return ((from.isBefore(other.getTo()) && this.getTo().isAfter(other.getFrom())));

	}
	
}
