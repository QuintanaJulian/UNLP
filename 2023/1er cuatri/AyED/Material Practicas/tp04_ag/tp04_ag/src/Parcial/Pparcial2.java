package Parcial;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp04.ejercicio1.ArbolGeneral;

public class Pparcial2 {
    private boolean Respuesta;


    public void setRespuesta (boolean Respuesta){
        this.Respuesta = Respuesta;
    }

    public boolean getRespuesta (){
        return Respuesta;
    }


    public boolean esDeSeleccion (ArbolGeneral<Integer> arbol){

        setRespuesta(true);
        if (arbol != null){
            if (arbol.tieneHijos()){
                esDeSeleccionAux(arbol);
            }

        }
        return getRespuesta();
    }



    private int esDeSeleccionAux (ArbolGeneral<Integer> AG){
        if (getRespuesta()){
            ListaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>();
            int minimo = 99999999;

            ListaGenerica<ArbolGeneral<Integer>> hijos = AG.getHijos();
            hijos.comenzar();
            while (!hijos.fin()){
                ArbolGeneral<Integer> dato = hijos.proximo();
                if (dato.tieneHijos()){
                    L.agregarFinal(esDeSeleccionAux(dato));
                } else L.agregarFinal(dato.getDato());
                }

            L.comenzar();
            while (!L.fin()){
                minimo = Math.min(minimo, L.proximo());
            }
            if (minimo != AG.getDato()){
                setRespuesta(false);
            }

        }
        return AG.getDato();
    }


    }
