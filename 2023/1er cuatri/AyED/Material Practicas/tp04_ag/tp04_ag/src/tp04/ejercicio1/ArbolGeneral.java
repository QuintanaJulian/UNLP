package tp04.ejercicio1;

import tp02.ejercicio2.ColaGenerica;
import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

public class ArbolGeneral<T> {

	private T dato;

	private ListaGenerica<ArbolGeneral<T>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();

	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public void setHijos(ListaGenerica<ArbolGeneral<T>> hijos) {
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ArbolGeneral(T dato) {
		this.dato = dato;
	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos) {
		this(dato);
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		return this.hijos;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		this.getHijos().agregarFinal(unHijo);
	}

	public boolean esHoja() {

		return !this.tieneHijos();
	}

	public boolean tieneHijos() {
		return !this.hijos.esVacia();
	}

	public boolean esVacio() {

		return this.dato == null && !this.tieneHijos();
	}


	public void eliminarHijo(ArbolGeneral<T> hijo) {
		if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			if (hijos.incluye(hijo))
				hijos.eliminar(hijo);
		}
	}

	public ListaEnlazadaGenerica<T> preOrden() {
		return null;
	}

	public Integer altura() {
		int profundidad = 0;
		ColaGenerica<ArbolGeneral<T>> Cola = new ColaGenerica <ArbolGeneral <T>>();
		ListaGenerica<ArbolGeneral<T>> LEG = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		ArbolGeneral<T> AB;
		if (this.tieneHijos()) {
			LEG = this.getHijos();
			LEG.comenzar();
			while (! LEG.fin()){
				Cola.encolar (LEG.proximo());
			}
			Cola.encolar(null);
		}
		while (! Cola.esVacia()){
			AB = Cola.desencolar();
			if (AB == null){
				profundidad ++;
				if (!Cola.esVacia()){
					Cola.encolar(null);
				}

			} else if (AB.tieneHijos()){
				LEG = AB.getHijos();
				LEG.comenzar();
				while (!LEG.fin()){
					Cola.encolar(LEG.proximo());
				}

			}
		}
		return profundidad;
	}

	public Integer nivel(T dato) {
		int nivel = 0;
		if (getDato() != dato) {
			T AGdato = getDato();
			ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
			ListaGenerica<ArbolGeneral<T>> LEG;

			if (this.tieneHijos()) {
				LEG = this.getHijos();
				LEG.comenzar();
				while (!LEG.fin()) {
					cola.encolar(LEG.proximo());
				}
				cola.encolar(null);
			}
			while ((!cola.esVacia()) && (AGdato != dato)) {
				ArbolGeneral<T> AG = cola.desencolar();
				if (AG == null) {
					nivel++;
					if (!cola.esVacia()) {
						cola.encolar(null);
					}
				} else if ((AG.tieneHijos()) && ((AGdato = AG.getDato()) != dato)) {                        //	I CANNOT MAKE IT TO PROCESS THE LAST LEVEL

					LEG = AG.getHijos();
					LEG.comenzar();
					while (!LEG.fin()) {
						cola.encolar(LEG.proximo());
					}
				}
			}
			if (AGdato != dato) {
				nivel = -9999;
			} else {nivel++;}
		}
		return nivel;
	}


	public Integer ancho() {
		int maxAncho = 0;
		if (getDato() != null) {
			maxAncho ++;
			int ancho = 0;
			ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
			ListaGenerica<ArbolGeneral<T>> LEG;
			ArbolGeneral<T> AG;
			if (this.tieneHijos()) {
				LEG = getHijos();
				LEG.comenzar();
				while (!LEG.fin()) {
					ancho++;
					cola.encolar(LEG.proximo());
				}
				cola.encolar(null);
				maxAncho = Math.max(maxAncho, ancho);
				while (!LEG.esVacia()) {
					AG = cola.desencolar();
					if (AG == null) {
						maxAncho = Math.max(maxAncho, ancho);
						ancho = 0;
						if (!cola.esVacia()) {
							cola.encolar(null);
						}
					} else if (AG.tieneHijos()) {
						LEG = AG.getHijos();
						LEG.comenzar();
						while (!LEG.fin()) {
							cola.encolar(LEG.proximo());
							ancho++;
						}
					}
				}
			}
		}

		return maxAncho;
	}

	public boolean esAncestro (T a, T b){
		ColaGenerica< ArbolGeneral<T>>  cola = new ColaGenerica < ArbolGeneral<T>>();
		boolean encontrado = false;
		if (this.getDato() != null){
			T dato = getDato();

			if (this.tieneHijos()){
				ListaGenerica<ArbolGeneral<T>> LAUX = this.getHijos();
				LAUX.comenzar();
				while (!LAUX.fin()){
					cola.encolar(LAUX.proximo());
				}
			}

			while ((!cola.esVacia()) && (dato != a)){
				ArbolGeneral<T> AB = cola.desencolar();
				dato = AB.getDato();
				if (dato == a){
					cola = new ColaGenerica<ArbolGeneral<T>>();
				}
				if (AB.tieneHijos()){
					ListaGenerica<ArbolGeneral<T>> LAUX = AB.getHijos();
					LAUX.comenzar();
					while (!LAUX.fin()){
						cola.encolar(LAUX.proximo());
					}
				}

			}

			if (dato == a){
				if (a == b) {
					encontrado = true;
				} else {
				while ((!cola.esVacia()) && (dato != b)){
					ArbolGeneral<T> AB = cola.desencolar();
					dato = AB.getDato();
					if (dato == b){
						encontrado = true;
					} else {
						if (AB.tieneHijos()){
							ListaGenerica<ArbolGeneral<T>> LAUX = AB.getHijos();
							LAUX.comenzar();
							while (!LAUX.fin()){
								cola.encolar (LAUX.proximo());
							}
						}
					}
				}}
			}
		}
		return encontrado;

	}

}