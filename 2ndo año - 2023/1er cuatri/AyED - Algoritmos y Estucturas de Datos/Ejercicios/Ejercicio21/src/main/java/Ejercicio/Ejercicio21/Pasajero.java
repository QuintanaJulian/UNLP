package Ejercicio.Ejercicio21;

import java.time.LocalDate;

public class Pasajero extends Usuario {
	private LocalDate fechaUltimoViaje;
	
	@Override
	public void cargarSaldo(double monto) {
		double saldo = this.getSaldo();
		if (LocalDate.now().minusDays(30).isAfter(fechaUltimoViaje)) {
			this.setSaldo(saldo + monto);
		} else {
			this.setSaldo(saldo + (monto * 0.9));
		}
		
	}

	@Override
	public void procesarViaje() {
		// TODO Auto-generated method stub
		
	}
	
	public Pasajero(String nombre) {
		super(nombre);
		fechaUltimoViaje = LocalDate.now();		
	}

}
