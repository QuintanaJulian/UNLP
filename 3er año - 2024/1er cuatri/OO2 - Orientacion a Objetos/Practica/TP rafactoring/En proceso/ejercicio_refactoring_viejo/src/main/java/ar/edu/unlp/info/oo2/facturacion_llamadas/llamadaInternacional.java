package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class llamadaInternacional extends Llamada{
	
	public llamadaInternacional(String origen, String destino, int duracion) {
		super(origen,destino,duracion);
	}
	
	public double calcularCostoLlamada() {
		return this.getDuracion() * 150 + (this.getDuracion() * 150 * 0.21) + 50; 
	}
}
