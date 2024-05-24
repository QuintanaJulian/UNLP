package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class clienteFisico extends Cliente{
	
	private String dni;
	private static double descuentoFisica;
	
	public clienteFisico(String nombre, String numeroTelefono, String dni) {
		super(nombre,numeroTelefono);
		this.dni = dni;
	}
	
	public String getDni() {
		return this.dni;
	}
	
	public void setDni(String dni) {
		this.dni = dni; 
	}
	
	public static double getDescuentoFisica() {
		return descuentoFisica; 
	}
	
	public static void setDescuentoFisica(double descuento) {
		clienteFisico.descuentoFisica = descuento; 
	}
	
	public double calcularDescuentoCliente(double c) {
		return c*clienteFisico.getDescuentoFisica(); 
	}
}
