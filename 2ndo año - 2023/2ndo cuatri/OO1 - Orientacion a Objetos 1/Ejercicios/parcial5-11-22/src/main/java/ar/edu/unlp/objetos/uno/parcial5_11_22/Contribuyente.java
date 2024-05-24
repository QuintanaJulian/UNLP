package ar.edu.unlp.objetos.uno.parcial5_11_22;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Contribuyente {
	private String nombre;
	private int DNI;
	private String email;
	private String localidad;
	
	private List<Bien> bienes;
	private List<Inmueble> inmuebles;
	private List<Automotor> automotores;
	private List<Embarcacion> embarcaciones;
	
	
	public boolean isFrom (String localidadBuscada) {
		return localidadBuscada.equals(this.getLocalidad());
	}
	
	public double getImpuestos () {
		return (( inmuebles.stream().mapToDouble(a -> a.getImpuesto()).sum()) + (automotores.stream().mapToDouble(a -> a.getImpuesto()).sum()) + (embarcaciones.stream().mapToDouble(a -> a.getImpuesto()).sum())); 
	}
	
	
	
	
	public Inmueble setInmueble(int numeroPartida, double precioLote, double precioEdificacion) {
		Inmueble I = new Inmueble (numeroPartida, precioLote, precioEdificacion);
		inmuebles.add(I);
		return I;
	}
	
	public Automotor setAutomotor (String marca, String modelo, String patente, LocalDate fechaFabricacion, double valor) {
		Automotor A = new Automotor (marca, modelo, patente, fechaFabricacion, valor);
		automotores.add(A);
		return A;
	}
	
	public Embarcacion setEmbarcacion (String nombre, String patente, LocalDate fechaFabricacion, double valor) {
		Embarcacion E = new Embarcacion(nombre, patente, fechaFabricacion, valor);
		embarcaciones.add(E);
		return E;
	}
	
	public Contribuyente (String nombre, int DNI, String email, String localidad) {
		this.nombre = nombre;
		this.DNI= DNI;
		this.email = email;
		this.localidad = localidad;
		
		inmuebles = new ArrayList<Inmueble>();
		automotores = new ArrayList<Automotor>();
		embarcaciones = new ArrayList<Embarcacion>();
		
		////
		
		bienes = new ArrayList<Bien>();
	}
	
	public String getLocalidad() {
		return localidad;
	}
}
