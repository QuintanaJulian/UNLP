package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class llamadaNacional extends Llamada{
	
	public llamadaNacional(String origen, String destino, int duracion) {
		super(origen,destino,duracion);
	}
	
	public double calcularCostoLlamada() {
		return this.getDuracion() * 3 + (this.getDuracion() * 3 * 0.21); 
	}

}
