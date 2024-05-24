package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.ArrayList;
import java.util.List;

public abstract class Cliente {
	public List<Llamada> llamadas = new ArrayList<Llamada>();
	private String nombre;
	private String numeroTelefono;
	
	
	public Cliente(String nombre, String numeroTelefono) {
		this.nombre = nombre;
		this.numeroTelefono = numeroTelefono;
	}
	
	public void agregarLlamada(Llamada llamada) { 
		llamadas.add(llamada); 
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getNumeroTelefono() {
		return numeroTelefono;
	}
	public void setNumeroTelefono(String numeroTelefono) {
		this.numeroTelefono = numeroTelefono;
	}
	
	public double calcularCostoLlamadasCliente() {
		return this.llamadas.stream()
				.mapToDouble(llamada -> llamada.calcularCostoLlamada())
				.sum();
	}
	
	public abstract double calcularDescuentoCliente(double c);
}
