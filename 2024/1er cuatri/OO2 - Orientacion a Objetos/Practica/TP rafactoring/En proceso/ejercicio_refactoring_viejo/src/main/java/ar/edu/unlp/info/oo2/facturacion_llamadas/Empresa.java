package ar.edu.unlp.info.oo2.facturacion_llamadas;

import java.util.ArrayList;
import java.util.List;

public class Empresa {
	private List<Cliente> clientes = new ArrayList<Cliente>();
	public GestorNumerosDisponibles guia = new GestorNumerosDisponibles();

	public String obtenerNumeroLibre() {
		return guia.obtenerNumeroLibre();
	}
	
	public Cliente registrarUsuarioFisico(String nombre, String dni) {
		String tel = this.obtenerNumeroLibre();
		Cliente cliente = new clienteFisico(nombre,tel,dni);
		clientes.add(cliente);
		return cliente;
	}
	
	public Cliente registrarUsuarioJuridico(String nombre, String cuit) {
		String tel = this.obtenerNumeroLibre();
		Cliente cliente = new clienteJuridico(nombre,tel,cuit);
		clientes.add(cliente);
		return cliente;
	}	
	
	public Llamada registrarLlamadaNacional(Cliente origen, Cliente destino, int duracion) {
		Llamada llamada = new llamadaNacional(origen.getNumeroTelefono(), destino.getNumeroTelefono(), duracion);
		origen.agregarLlamada(llamada);
		return llamada; 
	}
	
	public Llamada registrarLlamadaInternacional(Cliente origen, Cliente destino, int duracion) {
		Llamada llamada = new llamadaInternacional(origen.getNumeroTelefono(), destino.getNumeroTelefono(), duracion);
		origen.agregarLlamada(llamada);
		return llamada; 
	}

	public double calcularMontoTotalLlamadas(Cliente cliente) { 
		return this.clientes.stream()
				.mapToDouble(c -> c.calcularCostoLlamadasCliente())
				.sum(); 
	}

	public int cantidadDeUsuarios() {
		return clientes.size();
	}

	public boolean existeUsuario(Cliente persona) { 
		return clientes.contains(persona);
	}

	public GestorNumerosDisponibles getGestorNumeros() {
		return this.guia;
	}
}
