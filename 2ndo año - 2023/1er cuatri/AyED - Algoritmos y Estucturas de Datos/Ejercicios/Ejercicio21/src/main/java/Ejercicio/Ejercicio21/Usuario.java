package Ejercicio.Ejercicio21;

public abstract class Usuario {
	private String nombre;
	private double saldo;
	
	public abstract void cargarSaldo (double monto);
	
	public abstract void procesarViaje ();
	
	public Usuario(String nombre) {
		this.nombre= nombre;
		this.saldo= 0;
	}
	
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	
	public double getSaldo() {
		return saldo;
	}
	
}
