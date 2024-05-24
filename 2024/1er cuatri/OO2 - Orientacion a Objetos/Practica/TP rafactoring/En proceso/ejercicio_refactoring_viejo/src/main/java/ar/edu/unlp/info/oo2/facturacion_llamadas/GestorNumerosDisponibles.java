package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.TreeSet;
import java.util.ArrayList;
import java.util.Random;
import java.util.SortedSet;

public class GestorNumerosDisponibles {
	private SortedSet<String> lineas = new TreeSet<String>();
	private NumeroLibreStrategy tipoGenerador;
	
	
	public String obtenerNumeroLibre() {
		return tipoGenerador.obtenerNumeroLibre(this);
	}
	
	public SortedSet<String> getLineas() {
		return lineas;
	}
	
	public void setGenerador(NumeroLibreStrategy tipoGenerador) {
		this.tipoGenerador = tipoGenerador; 
	}

	public boolean agregarNumeroTelefono(String str) { 
		if (!getLineas().contains(str)) {
			getLineas().add(str);
			return true;
		}
		return false;
	}
}
