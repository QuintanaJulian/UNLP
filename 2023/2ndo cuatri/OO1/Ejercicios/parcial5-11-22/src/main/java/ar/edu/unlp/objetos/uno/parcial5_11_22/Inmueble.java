package ar.edu.unlp.objetos.uno.parcial5_11_22;

public class Inmueble implements Bien {
	private int numeroPartida;
	private double precioLote;
	private double precioEdificacion;
	
	public double getPrecio() {
		return this.getPrecioLote() + this.getPrecioEdificacion();
	}
	
	public double getImpuesto() {
		return (this.getPrecio() * 0.01);
	}
	
	private double getPrecioLote() {
		return this.precioLote;
	}
	
	private double getPrecioEdificacion() {
		return this.precioEdificacion;
	}
	
	public Inmueble (int numeroPartida, double precioLote, double precioEdificacion) {
		this.numeroPartida= numeroPartida;
		this.precioLote= precioLote;
		this.precioEdificacion= precioEdificacion;
	}	
	
	
}
