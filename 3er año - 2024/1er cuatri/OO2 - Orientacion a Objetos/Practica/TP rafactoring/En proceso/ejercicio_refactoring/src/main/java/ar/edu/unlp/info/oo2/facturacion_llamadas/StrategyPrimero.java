package ar.edu.unlp.info.oo2.facturacion_llamadas;

public class StrategyPrimero implements NumeroLibreStrategy{
	
	
	public String obtenerNumeroLibre(GestorNumerosDisponibles gestor) {
		String linea = gestor.getLineas().first();
		gestor.getLineas().remove(linea);
		return linea;
	}

}
