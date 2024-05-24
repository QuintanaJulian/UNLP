package ar.edu.unlp.objetos.uno.parcial5_11_22;

import static org.junit.jupiter.api.Assertions.assertEquals;


import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class SistemaTest {
	
	Sistema S;
	Contribuyente C;
	Inmueble I;
	Embarcacion E;
	Automotor A;
	
	
	@BeforeEach
	void setUp () {
		S = new Sistema();
		C= S.altaContribuyente("Juan", 44, "hola", "La Plata");

		I= S.altaInmueble(2548, 50000, 50000, C);
		
		A= S.altaAutomotor("AC681JD", "Renault", "Duster", (LocalDate.of(2016, 10, 5)), 100000, C);
		
		E= S.altaEmbarcacion("OPC043", "El barco", LocalDate.of(2020, 5, 4), 100000, C);
		
		
	}
	
	@Test
	public void getImpuestosContribuyenteTest() {
		assertEquals( (1000 + 5000 + 10000 ),S.getImpuestoContribuyente(C));
	}
	
	
}
