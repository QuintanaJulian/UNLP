package tp03.ejercicio1;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

import static tp03.ejercicio1.ProcesadorDeArbol.caminosPares;


public class main {
    public static void main (String [] Args){
        ArbolBinario<Integer> AB = new ArbolBinario<Integer>(5);

        ArbolBinario<Integer> AB1 = new ArbolBinario<Integer>(8);
        ArbolBinario<Integer> AB2 = new ArbolBinario<Integer>(5);
        ArbolBinario<Integer> AB3 = new ArbolBinario<Integer>(10);
        ArbolBinario<Integer> AB4 = new ArbolBinario<Integer>(12);
        ArbolBinario<Integer> AB5 = new ArbolBinario<Integer>(30);
        ArbolBinario<Integer> AB6 = new ArbolBinario<Integer>(16);
        ArbolBinario<Integer> AB7 = new ArbolBinario<Integer>(11);
        ArbolBinario<Integer> AB8 = new ArbolBinario<Integer>(55);
        ArbolBinario<Integer> AB9 = new ArbolBinario<Integer>(1);
        ArbolBinario<Integer> AB10 = new ArbolBinario<Integer>(4);





        AB3.agregarHijoDerecho(AB7);
        AB3.agregarHijoIzquierdo(AB8);
        AB4.agregarHijoIzquierdo(AB9);
        AB6.agregarHijoDerecho(AB10);

        AB2.agregarHijoDerecho(AB5);
        AB2.agregarHijoIzquierdo(AB6);


        AB1.agregarHijoDerecho(AB3);
        AB1.agregarHijoIzquierdo(AB4);

        AB.agregarHijoDerecho(AB1);
        AB.agregarHijoIzquierdo(AB2);


     /*   AB1.agregarHijoDerecho(AB9);
        AB1.agregarHijoIzquierdo(AB9);

        AB2.agregarHijoDerecho(AB10);

        AB.agregarHijoDerecho(AB1);
        AB.agregarHijoIzquierdo(AB2);*/

    /*    ListaGenerica<ListaEnlazadaGenerica<Integer>> LEG = caminosPares (AB);
        System.out.println("-------------");
        LEG.comenzar();
        System.out.println(LEG.tamanio());
        while (!LEG.fin()) {
            ListaEnlazadaGenerica<Integer> LAUX = LEG.proximo();

            System.out.println("-------------");
        }*/

      //  PParcial1 prueba = new PParcial1();

    //    System.out.println(prueba.metodo(AB));

        ProcesadorDeArbol Procesador = new ProcesadorDeArbol();
        ListaGenerica<Integer> LAUX = Procesador.resolver(AB, 2);
        LAUX.comenzar();
        while (!LAUX.fin()) {
            System.out.println(LAUX.proximo());
        }
    }
}
