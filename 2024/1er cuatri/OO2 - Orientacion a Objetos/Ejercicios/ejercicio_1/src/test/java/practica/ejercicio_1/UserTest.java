/**
 * 
 */
package practica.ejercicio_1;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserTest {
	
	User james;
	User guido;
	
	@BeforeEach
	void setUp() throws Exception {
		james = new User("James", "Glossing");
		guido = new User("Guido", "van Rossum");
	}
    @Test
    public void testNombreCompleto() {
        assertEquals("Glossing, James", james.getNombreCompleto());
        assertEquals("van Rossum, Guido", guido.getNombreCompleto());
        
    }
}