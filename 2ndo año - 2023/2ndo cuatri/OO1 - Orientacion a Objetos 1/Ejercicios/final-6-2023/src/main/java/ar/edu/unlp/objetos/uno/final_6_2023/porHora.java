package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;

public class porHora extends Contrato{
	private double precioHora;
	private int horasMes;
	
	@Override
	public double getBasico(boolean Hijo, boolean Conyuge) {
		return this.getPrecioHora() * this.getHorasMes();
	}
	

	public porHora(LocalDate fechaInicio, LocalDate fechaFin, double precioHora, int horasMes) {
		super (fechaInicio, fechaFin);
		this.precioHora = precioHora;
		this.horasMes = horasMes;
		
	}
	
	private int getHorasMes() {
		return horasMes;
	}
	private double getPrecioHora() {
		return precioHora;
	}
}
