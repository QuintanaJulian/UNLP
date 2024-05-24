package tp06.ejercicio3;

import tp02.ejercicio2.ColaGenerica;
import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

import java.util.Scanner;

public class Recorridos<T> {


    private Grafo<String> mapa;

    public Grafo<String> getMapa() {
        return mapa;
    }

    public void setMapa(Grafo<String> mapa) {
        this.mapa = mapa;
    }



    public ListaGenerica<String> devolverCamino (String ciudad1, String ciudad2){
        ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
        int esta= 0;
        Vertice<String> base = vertices.proximo();
        vertices.comenzar();
        while ((!vertices.fin()) && (esta < 2)){
            Vertice<String> actual= vertices.proximo();
            if (actual.dato().equals(ciudad1)){
                base = actual;
                esta++;
            }
            if (actual.dato().equals(ciudad2)){
                esta++;
            }
        }
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String>();
        if (esta == 2){
            boolean [] marca = new boolean[mapa.listaDeVertices().tamanio() + 1];
            buscarCiudadDestino (base.getPosicion(), respuesta, ciudad2, marca);
        }
        return respuesta;
    }


    private boolean buscarCiudadDestino ( int pos, ListaGenerica<String> respuesta, String destino, boolean[] marca){
        Vertice<String> actual = mapa.vertice(pos);
        marca[actual.getPosicion()] = true;
        boolean encontrado = false;
        respuesta.agregarFinal(actual.dato());
        if (actual.dato().equals(destino)) {
            encontrado = true;
        }else {
            ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(actual);
            adyacentes.comenzar();
            while ((! adyacentes.fin()) && (!encontrado)){
                int posAdy = adyacentes.proximo().verticeDestino().getPosicion();
                if (!marca[posAdy])
                    encontrado = buscarCiudadDestino(posAdy, respuesta, destino, marca);
                    if (!encontrado){
                        respuesta.eliminarEn(respuesta.tamanio());
                    }

            }
        }
        return encontrado;
    }









    public ListaGenerica<Vertice<T>> DFS(Grafo<T> grafo){
        ListaGenerica<Vertice<T>> recorrido = new ListaEnlazadaGenerica<Vertice<T>>();

        boolean [] marca = new boolean[grafo.listaDeVertices().tamanio() + 1];

        for (int i=1; i <= grafo.listaDeVertices().tamanio(); i++){
            if (!marca[i]){
                recorridoDFS (i, grafo, marca, recorrido);
            }
        }

        return recorrido;
    }


    private void recorridoDFS (int pos, Grafo<T> grafo, boolean[] marca, ListaGenerica<Vertice<T>> recorrido){
        marca[pos] = true;
        Vertice<T> vActual = grafo.vertice(pos);
        recorrido.agregarFinal(vActual);
        ListaGenerica<Arista<T>> Adyacentes = grafo.listaDeAdyacentes(vActual);
        Adyacentes.comenzar();
        while (!Adyacentes.fin()){
            int i = Adyacentes.proximo().verticeDestino().getPosicion();
            if (!marca[i]){
                recorridoDFS(i, grafo, marca, recorrido);
            }
        }


    }


    public ListaGenerica<Vertice<T>> BFS (Grafo<T> grafo){
        ListaGenerica<Vertice<T>> recorrido = new ListaEnlazadaGenerica<Vertice<T>>();
        boolean [] marca = new boolean[grafo.listaDeVertices().tamanio() + 1];

        for (int i=1; i< grafo.listaDeVertices().tamanio(); i++){
            if (!marca[i]) {
                recorridoBFS(i, grafo, marca ,recorrido);
            }
        }
        return recorrido;
    }

    private void recorridoBFS (int pos, Grafo<T> grafo, boolean[] marca, ListaGenerica<Vertice<T>> recorrido ){
        ColaGenerica<Vertice<T>> cola = new ColaGenerica<Vertice<T>>();
        cola.encolar(grafo.vertice(pos));
        marca[pos] = true;
        
        while (!cola.esVacia()){
            Vertice<T> actual = cola.desencolar();
            recorrido.agregarFinal(actual);
            ListaGenerica<Arista<T>> adyacentes = grafo.listaDeAdyacentes(actual);
            adyacentes.comenzar();
            while (! adyacentes.fin()) {
                int i = adyacentes.proximo().verticeDestino().getPosicion();
                if (!marca[i]){
                    cola.encolar(grafo.vertice(i));
                    marca[i] = true;
                }
            }
            
        }
    }






    public ListaGenerica<String> BFS2 (Grafo<String> grafo){
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String>();
        boolean [] marca = new boolean [grafo.listaDeVertices().tamanio() + 1];


        for (int i=1; i< grafo.listaDeVertices().tamanio(); i++){
            if (!marca[i]){
                recorridoBFS2 (i, grafo, respuesta, marca);
            }
        }
        return respuesta;
    }




    private void recorridoBFS2 (int pos, Grafo<String> grafo, ListaGenerica<String> respuesta, boolean[] marca){
        ColaGenerica<Vertice<String>> cola = new ColaGenerica<Vertice<String>>();
        cola.encolar(grafo.vertice(pos));
        marca[pos] = true;


        while (!cola.esVacia()){
            Vertice<String> actual = cola.desencolar();
            respuesta.agregarFinal(actual.dato());

            ListaGenerica<Arista<String>> listaAdy = grafo.listaDeAdyacentes(actual);
            listaAdy.comenzar();
            while (!listaAdy.fin()){
                actual = listaAdy.proximo().verticeDestino();
                if (!marca[actual.getPosicion()]){
                    cola.encolar(actual);
                    marca[actual.getPosicion()] = true;
                }
            }
        }
    }











    public ListaGenerica<String> devolverCaminoExceptuando (String ciudad1, String ciudad2, ListaGenerica<String> ciudades){
        ListaGenerica<String> Respuesta = new ListaEnlazadaGenerica<String>();
        int ciudadEnLista = 0;
        int posOrigen = 0;
        ListaGenerica<Vertice<String>> listaVertices = mapa.listaDeVertices();
        listaVertices.comenzar();
        while ((!listaVertices.fin()) && (ciudadEnLista < 2)){
            Vertice<String> actual = listaVertices.proximo();
            if (actual.dato().equals(ciudad1)){
                ciudadEnLista++;
                posOrigen = actual.getPosicion();
            } else if (actual.dato().equals(ciudad2)){
                ciudadEnLista++;
            }
        }
        if (ciudadEnLista == 2) {
            boolean [] marca = new boolean [listaVertices.tamanio() + 1] ;
            ListaGenerica<String> caminoAct = new ListaEnlazadaGenerica<String>();
            buscarCiudadDestinoExceptuando (posOrigen, ciudad2, ciudades, caminoAct, Respuesta, marca );
        }


        return Respuesta;
    }

    private boolean buscarCiudadDestinoExceptuando(int posActual, String destino, ListaGenerica<String> ciudadesExcluidas, ListaGenerica<String> caminoAct, ListaGenerica<String> respuesta, boolean[] marca) {
        Vertice<String> actual = mapa.vertice(posActual);
        marca[posActual] = true;
        caminoAct.agregarFinal(actual.dato());
        boolean encontrado = false;
        if (actual.dato().equals(destino)){
            clonarLista (respuesta, caminoAct);
            encontrado = true;
        } else {
            ListaGenerica<Arista<String>> aristaAdy = mapa.listaDeAdyacentes(actual);
            aristaAdy.comenzar();
            while ((!aristaAdy.fin()) && (!encontrado)){
                Vertice<String> dato = aristaAdy.proximo().verticeDestino();
                if ((!marca[dato.getPosicion()]) && (!contiene(dato.dato(), ciudadesExcluidas))){
                    encontrado = buscarCiudadDestinoExceptuando(dato.getPosicion(), destino, ciudadesExcluidas, caminoAct, respuesta, marca);
                    caminoAct.eliminarEn(caminoAct.tamanio());
                }
            }
        }
        return encontrado;
    }

    private boolean contiene(String dato, ListaGenerica<String> excluidas) {
        boolean encontrado = false;
        excluidas.comenzar();
        while (!excluidas.fin()){
            if (excluidas.proximo().equals(dato)){
                encontrado = true;
            }
        }
        return encontrado;
    }

    private void clonarLista(ListaGenerica<String> respuesta, ListaGenerica<String> actual) {
        System.out.println("Me llamaron aca");

        respuesta.comenzar();
        while (!respuesta.esVacia()){
            respuesta.eliminarEn(respuesta.tamanio());
           }
        actual.comenzar();
        while (!actual.fin()){
            respuesta.agregarFinal(actual.proximo());
        }
    }



    public ListaGenerica<String> caminoMasCorto (String ciudad1, String ciudad2){
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String> ();
        ListaGenerica<Vertice<String>> listaVertices = mapa.listaDeVertices();
        int posBase = 0;
        int ciudadesEncontradas = 0;
        listaVertices.comenzar();
        while ((!listaVertices.fin()) && (ciudadesEncontradas<2)){
            Vertice<String> actual = listaVertices.proximo();
            if (actual.dato().equals(ciudad1)){
                posBase = actual.getPosicion();
                ciudadesEncontradas++;
            }else if (actual.dato().equals(ciudad2)){
                ciudadesEncontradas++;
            }
        }

        if (ciudadesEncontradas == 2){
            boolean[] marca = new boolean[mapa.listaDeVertices().tamanio() + 1];
            ListaGenerica<String> caminoActual = new ListaEnlazadaGenerica<String> ();
            int valorAlto =  Integer.MAX_VALUE;
            buscarCaminoMasCorto (posBase, ciudad2, 0, valorAlto, caminoActual, respuesta, marca);
        }
        return respuesta;
    }

    private int buscarCaminoMasCorto(int posActual, String destino,int valorActual, int valorMinimo, ListaGenerica<String> caminoActual, ListaGenerica<String> respuesta, boolean[] marca) {
        Vertice<String> actual = mapa.vertice(posActual);
        caminoActual.agregarFinal(actual.dato());
        marca[posActual] = true;
        if (actual.dato().equals(destino)){
            if (valorActual < valorMinimo){
                valorMinimo = valorActual;
                clonarLista(respuesta, caminoActual);
            }
        } else{
            ListaGenerica<Arista<String>> listaAdy = mapa.listaDeAdyacentes(actual);
            listaAdy.comenzar();
            while (!listaAdy.fin()){
                Arista<String> dato = listaAdy.proximo();
                if ((!marca[dato.verticeDestino().getPosicion()]) && ((valorActual + dato.peso() ) < valorMinimo)){
                    valorMinimo = buscarCaminoMasCorto(dato.verticeDestino().getPosicion(), destino, (valorActual + dato.peso()), valorMinimo, caminoActual, respuesta, marca);
                    marca[dato.verticeDestino().getPosicion()] = false;
                    caminoActual.eliminarEn(caminoActual.tamanio());

                }
            }
        }
        return valorMinimo;
    }


    public ListaGenerica<String> caminoSinCargarCombustible (String ciudad1, String ciudad2, int tanqueAuto){
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String>();
        int posBase= 0;
        int ciudadesEnMapa = 0;
        ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
        vertices.comenzar();
        while ((!vertices.fin()) && (ciudadesEnMapa < 2)){
            Vertice<String> vertice = vertices.proximo();
            if (vertice.dato().equals(ciudad1)){
                posBase = vertice.getPosicion();
                ciudadesEnMapa++;
            }else if (vertice.dato().equals(ciudad2)){
                ciudadesEnMapa++;
            }
        }

        if (ciudadesEnMapa == 2){
            int tanqueActual = 0;
            ListaGenerica<String> caminoActual = new ListaEnlazadaGenerica<String>();
            boolean[] marca = new boolean[mapa.listaDeVertices().tamanio() +1];
            buscarCaminoSinCargarCombustible(posBase, ciudad2, tanqueActual, tanqueAuto, caminoActual, respuesta, marca);
        }
        return respuesta;
    }

    private boolean buscarCaminoSinCargarCombustible(int posActual, String destino, int tanqueActual, int tanqueAuto, ListaGenerica<String> caminoActual, ListaGenerica<String> respuesta, boolean[] marca) {
        Vertice<String> actual = mapa.vertice(posActual);
        marca[posActual] = true;
        caminoActual.agregarFinal(actual.dato());
        boolean encontrado = false;

        if (actual.dato().equals(destino)){
            clonarLista(respuesta, caminoActual);
            encontrado = true;
        } else {
            ListaGenerica<Arista<String>> listaAdy = mapa.listaDeAdyacentes(actual);
            listaAdy.comenzar();
            while ((!listaAdy.fin()) && (!encontrado)){
                Arista<String> dato = listaAdy.proximo();
                if ((!marca[dato.verticeDestino().getPosicion()]) && ((tanqueActual + dato.peso()) <= tanqueAuto)){
                    encontrado = buscarCaminoSinCargarCombustible(dato.verticeDestino().getPosicion(), destino, (tanqueActual + dato.peso()), tanqueAuto, caminoActual, respuesta, marca );
                    caminoActual.eliminarEn(caminoActual.tamanio());
                    marca[dato.verticeDestino().getPosicion()] = false;

                }
            }
        }


        return encontrado;

    }



    public ListaGenerica<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto){
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String> ();
        ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
        int ciudadesEnMapa = 0;
        int posOrigen = 0;
        vertices.comenzar();

        while ((!vertices.fin()) && (ciudadesEnMapa < 2)){
            Vertice<String> actual = vertices.proximo();
            if (actual.dato().equals(ciudad1)){
                posOrigen = actual.getPosicion();
                ciudadesEnMapa++;
            } else if (actual.dato().equals(ciudad2)){
                ciudadesEnMapa++;
            }
        }

        if (ciudadesEnMapa == 2){
            boolean [] marca = new boolean [vertices.tamanio() + 1];
            ListaGenerica<String> caminoActual = new ListaEnlazadaGenerica<String> ();
            int tanqueActual = tanqueAuto;
            int cargasActual = 0;
            int cargasMinimas = Integer.MAX_VALUE;
            buscarCaminoConMenorCargaDeCombustible(posOrigen, tanqueActual, tanqueAuto,  cargasActual, cargasMinimas, ciudad2, caminoActual,  respuesta, marca);
        }

        return respuesta;
    }

    private int buscarCaminoConMenorCargaDeCombustible (int posActual, int tanqueActual, int tanqueAuto, int cargasActual, int cargasMinimas, String destino, ListaGenerica<String> caminoActual, ListaGenerica<String> respuesta, boolean[] marca){
        Vertice<String> actual = mapa.vertice(posActual);
        caminoActual.agregarFinal (actual.dato());
        marca[posActual] = true;

        if (actual.dato().equals(destino)){
            clonarLista(respuesta, caminoActual);
            cargasMinimas = cargasActual;
        } else{
            ListaGenerica<Arista<String>> listaAdy = mapa.listaDeAdyacentes(actual);
            listaAdy.comenzar();
            while (!listaAdy.fin()){
                Arista<String> adyacente = listaAdy.proximo();
                if ((!marca[adyacente.verticeDestino().getPosicion()]) && (adyacente.peso() < tanqueAuto)) {
                    if (adyacente.peso() <= tanqueActual) {
                        cargasMinimas = buscarCaminoConMenorCargaDeCombustible(adyacente.verticeDestino().getPosicion(), (tanqueActual - adyacente.peso()), tanqueAuto, cargasActual, cargasMinimas, destino, caminoActual, respuesta, marca);
                        marca[adyacente.verticeDestino().getPosicion()] = false;
                        caminoActual.eliminarEn(caminoActual.tamanio());
                    } else if ((cargasActual + 1) < cargasMinimas) {
                        cargasMinimas = buscarCaminoConMenorCargaDeCombustible(adyacente.verticeDestino().getPosicion(), tanqueAuto, tanqueAuto, (cargasActual + 1), cargasMinimas, destino, caminoActual, respuesta, marca);
                        marca[adyacente.verticeDestino().getPosicion()] = false;
                        caminoActual.eliminarEn(caminoActual.tamanio());
                    }
                }
            }
        }

        return cargasMinimas;
    }



}



