package Ejercicio.Ejercicio16;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class TestEmpresa {

	private Empresa E;
	private User U1;
	private User U2;
	private User U3;
	private Propiedad P1;
	private LocalDate D1;
	private LocalDate D2;
	private LocalDate D3;
	private LocalDate D4;
	
	@BeforeEach
	public void setUp () {
		E = new Empresa();
		U1 = E.nuevoUsuario("Juli", 44, "99 y 9");
		U2 = E.nuevoUsuario("Karma", 40, "7 y 50");
		U3 = E.nuevoUsuario("Ale", 20, "5 y 45");
		P1 = E.nuevaPropiedad("Casa", "ehh messi", 10, "5 y 55", U1);
		D1 = LocalDate.of(2023, 11, 11);
		D2 = LocalDate.of(2023, 12, 11);
		D3 = LocalDate.of(2023, 10, 9);
		D4 = LocalDate.of(2023, 10, 11);
		
		E.hacerReserva(P1, D1, D2, U2);
		E.hacerReserva(P1, D3, D4, U3);
		
		
	}
	
	@Test
	public void buscarDisponiblesTest () {
		LocalDate D5 = LocalDate.of(2023, 10, 2);
		LocalDate D6 = LocalDate.of(2023, 10, 8);
		List<Propiedad> dispo = E.buscarDisponibles(D5, D6);
		System.out.println(dispo.toString());
		assertEquals (1, dispo.size() );
		
		D5 = LocalDate.of(2023, 10, 2);
		D6 = LocalDate.of(2023, 10, 9);
		dispo = E.buscarDisponibles(D5, D6);
		assertEquals (0, dispo.size() );
		
		
		D5 = LocalDate.of(2023, 12, 12);
		D6 = LocalDate.of(2023, 12, 20);
		dispo = E.buscarDisponibles(D5, D6);
		assertEquals (1, dispo.size() );
		
	}
	
}
