import tp02.ejercicio2.ColaGenerica;
import tp03.ejercicio1.ArbolBinario;

public class ProfundidadDeArbolBinario {
    private ArbolBinario<Integer> AB;

    public ProfundidadDeArbolBinario(ArbolBinario<Integer> AB) {
        this.AB = AB;
    }


    public int sumaElementosProfundiad(int p) {
        ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
        cola.encolar(AB);
        ArbolBinario<Integer> A;
        int profundidad = 0;
        int contador = 0;
        cola.encolar(null);
        while ((!cola.esVacia()) && (p > profundidad)) {
            A = cola.desencolar();
            if (profundidad < p) {
                if (A != null) {
                    if (A.tieneHijoDerecho()) {
                        cola.encolar(A.getHijoDerecho());
                    }
                    if (A.tieneHijoIzquierdo()) {
                        cola.encolar(A.getHijoIzquierdo());
                    }
                } else {
                    profundidad++;
                }

            } else {
                while (A != null) {
                    contador = contador + A.getDato();
                    A = cola.desencolar();
                    profundidad++;
                }
            }

        }
        return contador;
    }
}