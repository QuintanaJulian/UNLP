package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.SortedSet;
import java.util.TreeSet;

public class StrategyUltimo implements NumeroLibreStrategy{

	
	public String obtenerNumeroLibre(GestorNumerosDisponibles gestor) {
		String linea = gestor.getLineas().last();
		gestor.getLineas().remove(linea);
		return linea;
	}

}
