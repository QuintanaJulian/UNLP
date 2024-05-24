
package paquete;
import java.util.Set;


public class clase {
	private int hola;
	private String chau;

	public clase() {
	// TODO Auto-generated constructor stub
}


	public void setHola (int hola) {
	this.hola = hola;
}

	public int getHola () {
	return this.hola;
}

	public String getChau() {
	return chau;
}
	public void setChau(String chau) {
	this.chau = chau;
}

	public static void leerIntermediosFor (int a, int b) {
		for ( int aux = a;  aux <= b; aux++){
			System.out.println(aux);
		}
	}
	public static void leerIntermediosWhile (int a, int b){
			while (a <= b) {
				System.out.println(a);
				a++;
			}
		}
	public static void leerIntermediosRecursivo(int a, int b) {
		if (a <= b) {
			System.out.println(a);
			leerIntermediosRecursivo(++a, b);
		}
	}

	public static int [] vector (int a){
	int [] v = new int[a];
	for (int aux = 0; aux < a; aux++) {
		v[aux] = a * (aux + 1);
	}
	return v;
	}
}
