package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class dePlanta extends Contrato{
	private double sueldo;
	private double bonusConyuge;
	private double bonusHijo;
	
	public dePlanta(LocalDate fecha_inicio, double sueldo, double bonusHijo, double bonusConyuge) {
		super(fecha_inicio, LocalDate.MAX);
		this.sueldo = sueldo;
		this.bonusConyuge = bonusConyuge;
		this.bonusHijo = bonusHijo;
	}
	
	@Override
	public double getBasico(boolean Hijo, boolean Conyuge) {
		return this.getSueldo() + (Hijo? this.getBonusHijo(): 0) + (Conyuge? this.getBonusConyuge(): 0);
	}
	
	private double getBonusHijo() {
		return this.bonusHijo;
	}
	
	private double getBonusConyuge() {
		return this.bonusConyuge;
	}
	
	private double getSueldo() {
		return this.sueldo;
	}
	
	
	
}
