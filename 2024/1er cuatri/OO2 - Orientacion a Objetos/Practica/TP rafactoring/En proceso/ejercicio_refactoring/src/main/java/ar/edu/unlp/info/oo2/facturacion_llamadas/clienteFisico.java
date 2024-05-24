package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class clienteFisico extends Cliente{
	
	private String dni;
	private static double descuento = 0;
        
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
        
        public  double getDescuento(){
            return this.descuento;
        };
        
        public void setDescuento(double nuevoValor){
            this.descuento = nuevoValor;
        }
        
}
