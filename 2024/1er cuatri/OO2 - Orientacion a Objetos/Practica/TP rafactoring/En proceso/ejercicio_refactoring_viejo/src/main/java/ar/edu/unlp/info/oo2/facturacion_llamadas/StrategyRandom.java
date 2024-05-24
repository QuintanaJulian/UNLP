package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.List;
import java.util.Random;
import java.util.ArrayList; 

public class StrategyRandom implements NumeroLibreStrategy{
	
	public String obtenerNumeroLibre(GestorNumerosDisponibles gestor) {
		String linea = new ArrayList<String>(gestor.getLineas())
				.get(new Random().nextInt(gestor.getLineas().size())); 
		gestor.getLineas().remove(linea);
		return linea;
	}
	
}
