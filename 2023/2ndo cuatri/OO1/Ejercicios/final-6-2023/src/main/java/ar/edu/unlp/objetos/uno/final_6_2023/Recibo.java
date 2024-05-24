package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;

public class Recibo {
	private String nombre;
	private String apellido;
	private int CUIL;
	private int antiguedad;
	private double sueldoBasico;
	private LocalDate fechaRecibo;
	
	public Recibo(String nombre, String apellido, int CUIL, int antiguedad, double sueldoBasico) {
		this.nombre= nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.antiguedad = antiguedad;
		fechaRecibo = LocalDate.now();
		this.sueldoBasico = sueldoBasico;
	}
	
	private double calcularSueldoAntiguedad(double sueldoBasico, int antiguedad) {
		return (antiguedad < 20)? (antiguedad < 15)? (antiguedad < 10)? (antiguedad < 5)? 
				sueldoBasico : (sueldoBasico*1.3): (sueldoBasico*1.5) : (sueldoBasico*1.7) : (sueldoBasico*2);
	}
	
	
	private double getSueldoBasico() {
		return this.sueldoBasico;
	}
	
	public int getAntiguedad() {
		return antiguedad;
	}
	public double getSueldo() {
		return this.calcularSueldoAntiguedad(this.getSueldoBasico(), this.getAntiguedad());
	}
	
	public void setAntiguedad(int antiguedad) {
		this.antiguedad = antiguedad;
	}
	
}
