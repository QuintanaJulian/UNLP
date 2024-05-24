package tp04.ejercicio1;

import tp02.ejercicio2.ColaGenerica;
import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp04.ejercicio1.ArbolGeneral;

public class RecorridosAG {

    public boolean esImpar (Integer dato){
        boolean boleano;
        boleano = (dato % 2) != 0;
        return boleano;
    }


    public ListaGenerica<Integer> numerosImparesMayoresQuePreOrden (ArbolGeneral<Integer> a, Integer n){
        ListaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>();
        Integer dato = a.getDato();

        if (a.tieneHijos()){
            ListaGenerica<ArbolGeneral<Integer>> LAB;
            ListaGenerica<Integer> Laux;
            LAB= a.getHijos();
            LAB.comenzar();
            while (! LAB.fin()) {
                Laux = numerosImparesMayoresQuePreOrden(LAB.proximo(), n);
                Laux.comenzar();
                while (! Laux.fin()){
                    L.agregarFinal(Laux.proximo());
                }
            }
        }
        if ((dato > n) && ( esImpar(dato))){
            L.agregarInicio(dato);
        }
        return L;
    }

    public ListaGenerica<Integer> numerosImparesMayoresQueInOrden (ArbolGeneral<Integer> a, Integer n){
        ListaGenerica <Integer> L= new ListaEnlazadaGenerica<>();
        if (a.tieneHijos()){
            ListaGenerica <ArbolGeneral<Integer>> LAB;
            ListaGenerica <Integer> Laux;
            LAB = a.getHijos();
            LAB.comenzar();
            Laux = numerosImparesMayoresQueInOrden(LAB.proximo(), n);
            Laux.comenzar();
            while (! Laux.fin()){
                L.agregarFinal (Laux.proximo());
            }
            if ((a.getDato() > n) && (esImpar(a.getDato()))){
                L.agregarFinal(a.getDato());
            }
            while (! LAB.fin()){
                Laux = numerosImparesMayoresQueInOrden(LAB.proximo(), n);
                Laux.comenzar();
                while (!Laux.fin()){
                    L.agregarFinal(Laux.proximo());
                }
            }
        } else if ((a.getDato() > n) && (esImpar(a.getDato()))) {
            L.agregarFinal(a.getDato());
        }
        return L;
    }

    public ListaGenerica<Integer> numerosImparesMayoresQuePostOrden (ArbolGeneral<Integer> a, Integer n){
        ListaGenerica <Integer> L = new ListaEnlazadaGenerica<Integer>();

        if (a.tieneHijos()){
            ListaGenerica <ArbolGeneral<Integer>> LAB;
            ListaGenerica<Integer> Laux = new ListaEnlazadaGenerica<Integer>();
            LAB = a.getHijos();
            LAB.comenzar();
            while (!LAB.fin()){
                Laux = numerosImparesMayoresQuePostOrden( LAB.proximo(), n);
                Laux.comenzar();
                while (! Laux.fin()) {
                    L.agregarFinal(Laux.proximo());
                }
            }
        }
        if ((a.getDato() > n) && (esImpar(a.getDato())) ) {
            L.agregarFinal(a.getDato());
        }
        return L;
    }


    public ListaGenerica<Integer> numerosImparesMayoresQuePorNiveles (ArbolGeneral<Integer> a, Integer n){
        ListaGenerica<Integer> L = new ListaEnlazadaGenerica <Integer>();
        ColaGenerica<ArbolGeneral<Integer>> CAB = new ColaGenerica<ArbolGeneral<Integer>>();
        ArbolGeneral<Integer> AB;
        ListaGenerica <ArbolGeneral<Integer>> LAB;
        CAB.encolar(a);
        //CAB.encolar(null);
        while (!CAB.esVacia()){
            AB = CAB.desencolar();
            if ((AB.getDato() > n) && (esImpar(AB.getDato()))){
                L.agregarFinal(AB.getDato());
            }
            if (AB.tieneHijos()){
                LAB = AB.getHijos();
                LAB.comenzar();
                while (!LAB.fin()){
                    CAB.encolar(LAB.proximo());
                }
            }
        }
        return L;
    }



}