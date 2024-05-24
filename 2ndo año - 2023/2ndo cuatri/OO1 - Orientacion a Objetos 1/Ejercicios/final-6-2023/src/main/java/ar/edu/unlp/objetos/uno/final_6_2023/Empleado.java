package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Empleado {
	private String nombre;
	private String apellido;
	private int CUIL;
	private LocalDate fechaNacimiento;
	private List<Contrato> contratos;
	private boolean hijo;
	private boolean conyuge;
	

	public Empleado(String nombre, String apellido, int CUIL, LocalDate fechaNacimiento, boolean conyuge, boolean hijo) {
		this.nombre= nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.fechaNacimiento = fechaNacimiento;
		this.hijo= hijo;
		this.conyuge= conyuge;
		contratos = new ArrayList<Contrato>();
	}
	
	public int getAntiguedad() {
		return contratos.stream().mapToInt(a -> a.getDuracion()).sum();
	}
	
	public Contrato getContratoActual() {
		return contratos.stream().filter(a -> a.isActive()).findFirst().orElse(null);
	}
	
	public boolean isEmpleado (int CUIL) {
		return (CUIL == this.getCUIL()) ? true : false;
	}
	
	public void cargarContrato(Contrato C) {
		this.getContratoActual().finContrato();
		contratos.add(C);
	}
	
	public boolean esEmpleadoActivo() {
		if (this.getContratoActual() != null) {
			return true;
		} else return false;
	}
	
	public Recibo getReciboSueldo() {
		new Recibo(this.getNombre(), this.getApellido(), this.getCUIL(), this.getAntiguedad(), this.getContratoActual().getBasico(this.getHijo(), this.getConyuge()));
		return (new Recibo(this.getNombre(), this.getApellido(), this.getCUIL(), this.getAntiguedad(), this.getContratoActual().getBasico(this.getHijo(), this.getConyuge())));
	}
	
	
	
	
	
	
	private int getCUIL() {
		return this.CUIL;
	}
	
	private String getApellido() {
		return apellido;
	}
	private String getNombre() {
		return nombre;
	}
	private boolean getHijo() {
		return hijo;
	}
	
	private boolean getConyuge() {
		return conyuge;
	}
}
