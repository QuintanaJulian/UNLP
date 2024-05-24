package ar.edu.unlp.objetos.uno.Ejercicio2;

public class Balanza {
private int cantidadDeProductos;
private double precioTotal;
private double pesoTotal;

public Balanza() {
}



public void ponerEnCero() {
	precioTotal = 0;
	pesoTotal = 0;
	cantidadDeProductos = 0;
}



public Ticket emitirTicket(){
	return ( new Ticket(getCantidadDeProductos(), getPesoTotal(), getPrecioTotal()));
}

public int getCantidadDeProductos() {
	return cantidadDeProductos;
}
public double getPrecioTotal() {
	return precioTotal;
}
public double getPesoTotal() {
	return pesoTotal;
}
public void setCantidadDeProductos(int cantidadDeProductos) {
	this.cantidadDeProductos = cantidadDeProductos;
}  
public void setPrecioTotal(double precioTotal) {
	this.precioTotal = precioTotal;
}
public void setPesoTotal(double pesoTotal) {
	this.pesoTotal = pesoTotal;
}



public void agregarProducto(Producto producto) {
		cantidadDeProductos++;
	precioTotal += producto.getPrecio();
	pesoTotal+= producto.getPeso();
	
}









}