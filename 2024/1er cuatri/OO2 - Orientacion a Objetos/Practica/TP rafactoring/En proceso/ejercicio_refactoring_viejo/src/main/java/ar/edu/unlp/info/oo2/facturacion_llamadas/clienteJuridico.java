package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class clienteJuridico extends Cliente{
	
	private static double descuentoJuridica = 0.15;
	private String cuit;
	
	public clienteJuridico(String nombre, String numeroTelefono, String cuit) {
		super(nombre,numeroTelefono);
		this.cuit = cuit;
	}
	
	public String getCuit() {
		return this.cuit;
	}
	
	public void setCuit(String cuit) {
		this.cuit = cuit; 
	}
	
	public static double getDescuentoJuridica() {
		return descuentoJuridica; 
	}
	
	public static void setDescuento(double descuento) {
		clienteJuridico.descuentoJuridica = descuento; 
	}
	
	public double calcularDescuentoCliente(double c) {
		return c*clienteJuridico.getDescuentoJuridica(); 
	}
}
