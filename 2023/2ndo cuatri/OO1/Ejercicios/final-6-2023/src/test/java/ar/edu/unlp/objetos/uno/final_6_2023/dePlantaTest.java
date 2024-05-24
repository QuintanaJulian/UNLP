package ar.edu.unlp.objetos.uno.final_6_2023;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class dePlantaTest {
	private dePlanta DP;
	private dePlanta DP2;
	
	@BeforeEach
	public void setUp() {
		DP = new dePlanta(LocalDate.of(2020, 11, 11), 2000.5, 2000, 999);		
	}
	
	@Test
	public void getBasicoTest() {
		assertEquals(4999.5, DP.getBasico(true, true));
		assertEquals(4000.5, DP.getBasico(true, false));
		assertEquals(2999.5, DP.getBasico(false, true));
	}
	
	@Test
	public void isActiveTest() {
		assertTrue(DP.isActive());
		DP.finContrato();
		assertFalse(DP.isActive());
	}
	
	@Test
	public void getDuracionTest() {
		assertEquals(2, DP.getDuracion());
		DP.setFechaFinal(LocalDate.of(2023, 11, 9));
		DP.setFechaInicio(LocalDate.of(2020, 11, 9));
		assertEquals(3, DP.getDuracion());
	}
}
