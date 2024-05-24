package ar.edu.unlp.objetos.uno.Ejercicio2;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public Producto() {
		// TODO Auto-generated constructor stub
	}
	public double getPrecio() {
		return (getPrecioPorKilo() * getPeso());
	}
	public String getDescripcion() {
		return descripcion;
	}
	public double getPeso() {
		return peso;
	}
	public double getPrecioPorKilo() {
		return precioPorKilo;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}

}
