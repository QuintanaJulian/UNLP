package paquete;
import java.util.Scanner;  

public class main {
	
public static void main (String [] args) {
	clase.leerIntermediosFor(4,10);					//EJERCIO 1

	clase.leerIntermediosWhile(4, 10);

	clase.leerIntermediosRecursivo (4, 10);

		Scanner sc = new Scanner(System.in);					//EJERCIO 2
		int var = sc.nextInt();

		int [] vector = clase.vector(var);

		for (int aux= 0; aux < var; aux++){
			System.out.println(vector[aux]);
		}
	}
}
