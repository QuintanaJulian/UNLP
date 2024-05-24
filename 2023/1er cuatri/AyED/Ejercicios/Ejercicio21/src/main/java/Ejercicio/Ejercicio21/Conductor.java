package Ejercicio.Ejercicio21;

import java.time.LocalDate;

public class Conductor extends Usuario{
	private Auto auto;
	
	public Conductor(String nombre, Auto auto) {
		super(nombre);
		this.auto= auto;
	}

	@Override
	public void cargarSaldo(double monto) {
		double saldo = this.getSaldo();
		if (LocalDate.now().minusYears(5).isBefore(LocalDate.ofYearDay(auto.getModelo(), 1))) {
			this.setSaldo(saldo + (saldo * 0.9));			
		} else {
			this.setSaldo(saldo + (saldo * 0.95));
		}
			
	}

	@Override
	public void procesarViaje() {
		// TODO Auto-generated method stub
		
	}
	

}
