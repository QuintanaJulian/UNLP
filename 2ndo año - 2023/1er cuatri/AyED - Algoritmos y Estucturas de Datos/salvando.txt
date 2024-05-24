//package practica2_1_2;

import tp02.ejercicio1.*;
import C:\Users\quint\OneDrive\FACU\2023\1er cuatri\AyED\Material Practicas\ListasGenericas;
import tp02.ejercicio2.*;
import ListasGenericas.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");


        ListaDeEnterosConArreglos LEA = new ListaDeEnterosConArreglos();


        L ListasGenerica;
        String cadena = "123456h";
        char carac;
        int i = 0;
        while (i < cadena.length())  {
            carac = cadena.charAt(i);
            i++;
            LEA.agregarFinal (Character.getNumericValue(carac));
           // System.out.println(Character.getNumericValue(carac));

        }
        while (!(LEA.fin()))  {
            System.out.println(LEA.proximo());
           // LEA.proximo();
        }




        ListaDeEnterosEnlazada LEE = new ListaDeEnterosEnlazada();
        cadena = "7890z";
        //System.out.println(cadena);
        i = 0;
        while (i < cadena.length())  {

            carac = cadena.charAt(i);
            i++;
            LEE.agregarFinal (Character.getNumericValue(carac));
         // System.out.println(Character.getNumericValue(carac));

        }
      //  System.out.println(LEE.tamanio());
        LEE.comenzar();
        while (!(LEE.fin()))  {
            System.out.println(LEE.proximo());
            // LEE.proximo();

        }
        LEE.comenzar();
        preOrder (LEE);




        System.out.println("------------------------------------------------------------------------------");
//        ListaDeEnterosEnlazada L= new ListaDeEnterosEnlazada();
        ListaDeEnterosEnlazada L = calcularSucesion(6);
        L.comenzar();
        while (!(L.fin())) {
           // System.out.println("holafdf ");
            System.out.println(L.proximo());
        }



       /* ListaEnlazadaGenerica LEG= new ListaEnlazadaGenerica();

        char ch;
        System.in.read(ch);

        LEG.agregarFinal(ch);

        System.out.println(LEG.toString());*/

    }

    public static void preOrder (ListaDeEnterosEnlazada Lista){

        if (!(Lista.fin())){
            int L= Lista.proximo();
            preOrder (Lista);
            System.out.println(L);
        }
    }

    static ListaDeEnterosEnlazada L1;
    public static ListaDeEnterosEnlazada calcularSucesion (int N){
    //    static ListaDeEnterosEnlazada L;
     //   L = new ListaDeEnterosEnlazada();
      //  L.agregarInicio(N);
        if (N != 1){
            if ((N % 2) == 0){
                calcularSucesion(N / 2);
            }
            else { calcularSucesion((N * 3)+1); }
        }
        else {   L1 = new ListaDeEnterosEnlazada();}        //L1 Esta creada como variable estaatica del metodo por qu sino el IDE dice que puede no estardeclarada y tira error
        L1.agregarInicio(N);
        return L1;
    }
}