package tp03.ejercicio1;
import tp02.ejercicio2.ColaGenerica;
public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 


	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	/*public int contarHojas {
		int hojas = 0;
		contar
	}*/
	public int contarHojas(){
		int hojas = 0;
		if (esHoja()){
			hojas = hojas + 1;
		}
		else {
			if (tieneHijoDerecho()){
				hojas = hojas + getHijoDerecho().contarHojas();
			}
			if (tieneHijoIzquierdo()){
				hojas = hojas + getHijoIzquierdo().contarHojas();
			}
		}
		return hojas;
	}



    public ArbolBinario<T> espejo() {
		ArbolBinario<T> A = new ArbolBinario<T>(getDato());
		if (tieneHijoIzquierdo()){
			A.agregarHijoDerecho(hijoIzquierdo.espejo());
		}
		if (tieneHijoDerecho()){
			A.agregarHijoIzquierdo(hijoDerecho.espejo());
		}
		return A;
	}


	public void entreNiveles(int n, int m){
		ColaGenerica<ArbolBinario<T>> CG = new ColaGenerica<ArbolBinario<T>>();
		CG.encolar(this);
		CG.encolar(null);
		ArbolBinario<T> A;
		int nivel = 0;
		while ((!CG.esVacia()) && (nivel <= m)){
			A = CG.desencolar();
			if (A != null){
				if (nivel >= n) {
					System.out.println(A.getDato());
				}
				if (A.tieneHijoIzquierdo()){
					CG.encolar(A.getHijoIzquierdo());
				}
				if (A.tieneHijoDerecho()){
					CG.encolar(A.getHijoDerecho());
				}
			}
			else {
				CG.encolar(null);
				nivel = nivel + 1;
			}
		}
	}

	

}
