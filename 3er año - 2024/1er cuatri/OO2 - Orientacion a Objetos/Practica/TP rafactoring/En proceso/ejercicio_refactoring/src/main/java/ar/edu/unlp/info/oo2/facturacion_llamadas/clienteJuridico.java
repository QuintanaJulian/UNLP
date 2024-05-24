 package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class clienteJuridico extends Cliente{
	
	private String cuit;
	private static double descuento = 0.15;
        
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
	        
       
        
        public  double getDescuento(){
            return this.descuento;
        };
        
        public void setDescuento(double nuevoValor){
            this.descuento = nuevoValor;
        }
}
