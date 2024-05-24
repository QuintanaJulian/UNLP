package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.ArrayList;
import java.util.List;

public abstract class Cliente {
	private String nombre;
	private String numeroTelefono;
	private List<Llamada> llamadas;

	public Cliente(String nombre, String numeroTelefono) {
		this.nombre = nombre;
		this.numeroTelefono = numeroTelefono;
                llamadas = new ArrayList<Llamada>();
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
	
        public abstract double getDescuento();
        public abstract void setDescuento(double nuevoValor);
	
        public double calcularCostoLlamadasCliente() {
		Double precio = this.llamadas.stream()
				.mapToDouble(llamada -> llamada.calcularCostoLlamada())
				.sum();
                return this.calcularDescuentoCliente(precio);      
	}
	        
        
        
        public double calcularDescuentoCliente(double precio) {
		return precio - (precio*this.getDescuento()); 
	}
}
 