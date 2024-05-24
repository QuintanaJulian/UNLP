package ar.edu.unlp.objetos.uno.Ejercicio14;

//import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DateLapsteTest {
		
	
	private DateLapse2 controladorFecha;
	private LocalDate fecha1;
	private LocalDate fecha2;
	
	@BeforeEach
	public void setup() {
		controladorFecha = new DateLapse2();
		controladorFecha.setFrom(2002, 11, 11);
		controladorFecha.setTo(2002, 11, 21);
		
		fecha1= LocalDate.of(2002, 11, 18);
		fecha2= LocalDate.of(2022, 12, 20);
	}
	
	
	@Test
	public void setFromTest () {
		assertFalse (controladorFecha.setFrom(2023, 11, 31));
		assertTrue (controladorFecha.setFrom(2005, 10, 3));
	}

	@Test
	public void setToTest () {
		assertFalse (controladorFecha.setTo(2023, 2, 30 ));
		assertTrue (controladorFecha.setTo(2005, 10, 3));
	}
	
	@Test
	public void sizeInDaysTest () {
		assertEquals (10, controladorFecha.getSizeInDays());
	}
	
	
	
	@Test
	public void includesDatesTest () {
		assertTrue (controladorFecha.includesDate(fecha1));
		assertFalse (controladorFecha.includesDate(fecha2));
	}
	
}
