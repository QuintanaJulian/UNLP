package tp06.ejercicio3;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

import static tp06.ejercicio3.VisitaOslo.paseoEnBici;
import static tp06.ejercicio3.VisitaOslo.paseoIncluyendo;

public class TestDFSyBFS {
    public static void main(String[] args){






        Vertice<String> v1 = new VerticeImplListAdy<String>("Buenos Aires");
        Vertice<String> v2 = new VerticeImplListAdy<String>("Santiago");
        Vertice<String> v3 = new VerticeImplListAdy<String>("Lima");
        Vertice<String> v4 = new VerticeImplListAdy<String>("Montevideo");
        Vertice<String> v5 = new VerticeImplListAdy<String>("Asuncion");
        Vertice<String> v6 = new VerticeImplListAdy<String>("Caracas");
        Vertice<String> v7 = new VerticeImplListAdy<String>("La Habana");

        Grafo<String> ciudades = new GrafoImplListAdy<String>();

        ciudades.agregarVertice(v1);
        ciudades.agregarVertice(v2);
        ciudades.agregarVertice(v3);
        ciudades.agregarVertice(v4);
        ciudades.agregarVertice(v5);
        ciudades.agregarVertice(v6);
        ciudades.agregarVertice(v7);

        ciudades.conectar(v1, v2);
        ciudades.conectar(v1, v3, 1);
        ciudades.conectar(v1, v4);
        ciudades.conectar(v1, v5);
        ciudades.conectar(v2, v5);
        ciudades.conectar(v2, v7, 2);
        ciudades.conectar(v3, v5);
        ciudades.conectar(v4, v5);
        ciudades.conectar(v6, v5);
        ciudades.conectar(v6, v7);

        ciudades.conectar(v4, v1, 1);
        ciudades.conectar(v3, v7, 1);


        Recorridos<String> r = new Recorridos<String>();
        System.out.println("--- Se imprime el GRAFO con DFS ---");
        ListaGenerica <Vertice<String>> lis = r.DFS(ciudades);
        lis.comenzar();
        while(!lis.fin()) {
            System.out.println(lis.proximo().dato());
        }

        System.out.println(" ");
        System.out.println("--- Se imprime el GRAFO con BFS ---");
        ListaGenerica<Vertice<String>> lis2 = r.BFS(ciudades);
        lis2.comenzar();
        while(!lis2.fin()) {
            System.out.println(lis2.proximo().dato());
        }


        r.setMapa(ciudades);
        ListaGenerica<String> respuesta = r.devolverCamino("Lima", "Buenos Aires");
        respuesta.comenzar();
        System.out.println("El camino entre las 2 ciudades es:");
        while (!respuesta.fin()){
            System.out.println(respuesta.proximo());
        }
        System.out.println("----------------------------");


        ListaGenerica<String> exluidos = new ListaEnlazadaGenerica<String> ();
        exluidos.agregarFinal("Santiago");
        ListaGenerica<String> respuesta2 = r.devolverCaminoExceptuando("Montevideo", "La Habana", exluidos);
        respuesta2.comenzar();
        System.out.println("El camino entre las 2 ciudades es:");
        while (!respuesta2.fin()){
            System.out.println(respuesta2.proximo());
        }
        System.out.println("----------------------------");





        ListaGenerica<String> respuesta3 = r.caminoMasCorto("Montevideo", "La Habana");
        respuesta3.comenzar();
        System.out.println("El camino mas corto entre las 2 ciudades es:");
        while (!respuesta3.fin()){
            System.out.println(respuesta3.proximo());
        }
        System.out.println("----------------------------");





        ListaGenerica<String> respuesta4 = r.caminoSinCargarCombustible("Montevideo", "La Habana", 3);
        respuesta4.comenzar();
        System.out.println("El camino sin cargar nafta entre las 2 ciudades es:");
        while (!respuesta4.fin()){
            System.out.println(respuesta4.proximo());
        }
        System.out.println("----------------------------");





        ListaGenerica<String> respuesta5 = r.caminoConMenorCargaDeCombustible ("Montevideo", "La Habana", 4);
        respuesta5.comenzar();
        System.out.println("El camino con menor carga de nafta entre las 2 ciudades es:");
        while (!respuesta5.fin()){
            System.out.println(respuesta5.proximo());
        }
        System.out.println("----------------------------");



        //Ejercicio 6
        ListaGenerica<String> exluidos2 = new ListaEnlazadaGenerica<String> ();
        exluidos2.agregarFinal("Santiago");
        //exluidos2.agregarFinal("Buenos Aires");
        ListaGenerica<String> respuesta6 = paseoEnBici (ciudades, "La Habana", 4, exluidos2);
        respuesta6.comenzar();
        System.out.println("El camino entre las 2 ciudades que cumple el tiempo es:");
        while (!respuesta6.fin()){
            System.out.println(respuesta6.proximo());
        }
        System.out.println("----------------------------");




        //Ejercicio random paseo incluyendo
        ListaGenerica<String> incluidos = new ListaEnlazadaGenerica<String> ();
        incluidos.agregarFinal("Buenos Aires");
        //incluidos.agregarFinal("Buenos Aires");
        ListaGenerica<String> respuesta7 = paseoIncluyendo(ciudades, "Montevideo", "La Habana", 4, incluidos);
        respuesta7.comenzar();
        System.out.println("El camino entre las 2 ciudades que cumple el tiempo y pasa por los lugares deseados:");
        while (!respuesta7.fin()){
            System.out.println(respuesta7.proximo());
        }
        System.out.println("----------------------------");



    }
}