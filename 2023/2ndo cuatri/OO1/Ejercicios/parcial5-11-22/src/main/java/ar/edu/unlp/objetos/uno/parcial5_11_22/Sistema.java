package ar.edu.unlp.objetos.uno.parcial5_11_22;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Sistema {
	private List<Contribuyente> contribuyentes;
	
	public Contribuyente altaContribuyente (String nombre, int DNI, String email, String localidad) {
		Contribuyente C = new Contribuyente (nombre, DNI, email, localidad);
		contribuyentes.add(C);
		return C;
		
	}
	
	public Inmueble altaInmueble (int numPartida, double valorLote, double valorEdificio, Contribuyente C) {
		return C.setInmueble(numPartida, valorLote, valorEdificio);
	}
	
	public Automotor altaAutomotor (String patente, String marca, String modelo, LocalDate fechaFabricacion, double valor, Contribuyente C) {
		return C.setAutomotor(patente, marca, modelo, fechaFabricacion, valor);
	}
	
	public Embarcacion altaEmbarcacion (String patente, String nombre, LocalDate fechaFabricacion, double valor, Contribuyente C) {
		return C.setEmbarcacion(patente, nombre, fechaFabricacion, valor);
	}
	
	public double getImpuestoContribuyente(Contribuyente C) {
		return C.getImpuestos();
	}
	
	public List<Contribuyente> getMayoresContribuyenteLocalidad(String localidad, int N){
		return contribuyentes.stream().limit(N).sorted((a,b) -> ((Double) b.getImpuestos()).compareTo((Double)a.getImpuestos())).filter(a -> a.isFrom(localidad)).collect(Collectors.toList());

	}
	
	public Sistema() {
		contribuyentes = new ArrayList<Contribuyente>();
	}
}
