package ar.edu.unlp.objetos.uno.final_6_2023;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Sistema {
	private List<Empleado> empleados;
	
	
	public Sistema() {
		empleados = new ArrayList<Empleado>();
		
	}
	
	public void altaEmpleado (String nombre, String apellido, int CUIL, LocalDate fecha_nacimiento, boolean conyuge, boolean hijo) {
		empleados.add(new Empleado(nombre, apellido, CUIL, fecha_nacimiento, conyuge, hijo));
	}
	
	public Empleado buscarEmpleado(int CUIL) {
		return empleados.stream().filter(a-> a.isEmpleado(CUIL)).findFirst().orElse(null);
	}
	
	public boolean bajaEmpleado (int CUIL) {
		Empleado empleado = this.buscarEmpleado(CUIL);
		if (empleado != null) {
			empleados.remove(empleado) ;
			return true;
		}
		else return false;
	}
	
	public void cargarContratoPorHora(Empleado E, LocalDate fecha_inicio, LocalDate fecha_fin, double valorHora, int horasMes) {
		E.cargarContrato (new porHora(fecha_inicio, fecha_fin, valorHora, horasMes));
	}
	
	public void cargarContratoDePlanta(Empleado E, LocalDate fecha_inicio, double sueldo, double bonusConyuge, double bonusHijo) {
		E.cargarContrato (new dePlanta(fecha_inicio, sueldo, bonusConyuge, bonusHijo));
	}
	
	public List<Empleado> getEmpleadosSinContratoActivo(){
		return empleados.stream().filter(a -> a.esEmpleadoActivo()).collect(Collectors.toList());
	}
	
	public List<Recibo> crearRecibosSueldo (){
		return empleados.stream().map(a -> a.getReciboSueldo()).collect(Collectors.toList());
	}
	
}
