package tp04.ejercicio1;

import Parcial.Pparcial2;
import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

import static tp04.ejercicio1.AnalizadorArbol.devolverMaximoPromedio;

public class main {
    public static void main(String[] args) {

       // {
            ArbolGeneral<Integer> AB = new ArbolGeneral<Integer>(5);

            ArbolGeneral<Integer> AB1 = new ArbolGeneral<Integer>(8);
            ArbolGeneral<Integer> AB2 = new ArbolGeneral<Integer>(5);
            ArbolGeneral<Integer> AB3 = new ArbolGeneral<Integer>(10);
            ArbolGeneral<Integer> AB4 = new ArbolGeneral<Integer>(12);
            ArbolGeneral<Integer> AB5 = new ArbolGeneral<Integer>(30);
            ArbolGeneral<Integer> AB6 = new ArbolGeneral<Integer>(16);
            ArbolGeneral<Integer> AB7 = new ArbolGeneral<Integer>(11);
            ArbolGeneral<Integer> AB8 = new ArbolGeneral<Integer>(55);
            ArbolGeneral<Integer> AB9 = new ArbolGeneral<Integer>(1);
            ArbolGeneral<Integer> AB10 = new ArbolGeneral<Integer>(4);


            AB3.agregarHijo(AB8);
            AB3.agregarHijo(AB9);
            AB6.agregarHijo(AB10);

            AB2.agregarHijo(AB5);
            AB2.agregarHijo(AB6);
            AB2.agregarHijo(AB7);

            AB1.agregarHijo(AB3);
            AB1.agregarHijo(AB4);

            AB.agregarHijo(AB1);
            AB.agregarHijo(AB2);
       // }

        //{
            ArbolGeneral<AreaEmpresa> AE = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(5));

            ArbolGeneral<AreaEmpresa> AE1 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(8));
            ArbolGeneral<AreaEmpresa> AE2 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(5));
            ArbolGeneral<AreaEmpresa> AE3 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(10));
            ArbolGeneral<AreaEmpresa> AE4 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(12));
            ArbolGeneral<AreaEmpresa> AE5 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(30));
            ArbolGeneral<AreaEmpresa> AE6 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(16));
            ArbolGeneral<AreaEmpresa> AE7 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(11));
            ArbolGeneral<AreaEmpresa> AE8 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(55));
            ArbolGeneral<AreaEmpresa> AE9 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(1));
            ArbolGeneral<AreaEmpresa> AE10 = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa(4));


            AE3.agregarHijo(AE8);
            AE3.agregarHijo(AE9);
            AE6.agregarHijo(AE10);

            AE2.agregarHijo(AE5);
            AE2.agregarHijo(AE6);
            AE2.agregarHijo(AE7);

            AE1.agregarHijo(AE3);
            AE1.agregarHijo(AE4);

            AE.agregarHijo(AE1);
            AE.agregarHijo(AE2);
            //  }

      //  AnalizadorArbol ObjE = new AnalizadorArbol();
        System.out.println (devolverMaximoPromedio(AE));

        ListaGenerica<Integer> L = new ListaEnlazadaGenerica<>();
        RecorridosAG AG = new RecorridosAG();

    //    System.out.println( AB.esAncestro(AB4.getDato(), AB1.getDato()));

      //  L= AG.numerosImparesMayoresQuePreOrden(AB, 6);
      //  L= AG.numerosImparesMayoresQueInOrden(AB, 0);
        //L= AG.numerosImparesMayoresQuePostOrden(AB, 0 );
        //L= AG.numerosImparesMayoresQuePorNiveles(AB, 0);
        L.comenzar();
        while (!L.fin()){
            System.out.println(L.proximo());
        }
      //  System.out.println (AB1.altura());

        System.out.println (AB.nivel(55)); //ERORR/

   //     System.out.println (AB.ancho());          //ERORR/

            Pparcial2 parcial = new Pparcial2();
            System.out.println (parcial.esDeSeleccion(AB));


    }
}