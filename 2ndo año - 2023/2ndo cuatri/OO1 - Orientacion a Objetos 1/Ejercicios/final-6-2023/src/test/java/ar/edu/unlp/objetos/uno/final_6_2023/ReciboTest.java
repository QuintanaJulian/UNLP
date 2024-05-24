package ar.edu.unlp.objetos.uno.final_6_2023;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReciboTest {
	private Recibo R;
	
	@BeforeEach
	public void setUp() {
		R= new Recibo("juli", "quintan", 2042339, 2, 100);
	}
	
	@Test
	public void getSueldoTest() {
		assertEquals(100, R.getSueldo());
		R.setAntiguedad(5);
		assertEquals(130, R.getSueldo());
		R.setAntiguedad(10);
		assertEquals(150, R.getSueldo());
		R.setAntiguedad(15);
		assertEquals(170, R.getSueldo());
		R.setAntiguedad(20);
		assertEquals(200, R.getSueldo());
	}
	
	
}
