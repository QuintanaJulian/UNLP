package ar.edu.unlp.objetos.uno.final_6_2023;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class porHoraTest {
	
	private porHora PH;
	private porHora PH2;
	
	@BeforeEach
	public void setUp () {
		PH = new porHora(LocalDate.of(2020, 10, 15), LocalDate.of(2023, 5, 11), 20, 10);
		PH2 = new porHora(LocalDate.of(2022, 10, 15), LocalDate.of(2023, 11, 11), 50, 3);
		
	}
	@Test
	public void getBasicoTest() {
		assertEquals(200, PH.getBasico(false, false));
		assertEquals(150, PH2.getBasico(false, false));
	}
	
	
	@Test
	public void getDuracionTest() {
		assertEquals(2, PH.getDuracion());
		assertEquals(1, PH2.getDuracion());
	}
	
	@Test
	public void finContratoTest() {
		PH.finContrato();
		assertEquals(LocalDate.now(), PH.getFechaFinal());
	}
	
	@Test
	public void isActiveTest() {
		assertFalse(PH.isActive());
		assertTrue(PH2.isActive());
	}
	
}
