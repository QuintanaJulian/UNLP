package ar.edu.unlp.objetos.uno.Ejercicio2;

import java.time.LocalDate;

public class Ticket {
	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	
	public double impuesto () {
		return (getPrecioTotal() * 0.21);
	}
	
	
	public Ticket(int cantidad, double peso, double precio) {
		// TODO Auto-generated constructor stub
		setPesoTotal(peso);
		setPrecioTotal(precio);
		setCantidadDeProductos(cantidad);
		setFecha();
	}
	
	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}
	public LocalDate getFecha() {
		return fecha;
	}
	public double getPesoTotal() {
		return pesoTotal;
	}
	public double getPrecioTotal() {
		return precioTotal;
	}
	public void setCantidadDeProductos(int cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	}
public void setFecha() {
	this.fecha = LocalDate.now();
}
public void setPrecioTotal(double precioTotal) {
	this.precioTotal = precioTotal;
}
public void setPesoTotal(double pesoTotal) {
	this.pesoTotal = pesoTotal;
}
	
}
