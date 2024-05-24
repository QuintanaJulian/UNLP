package tp06.ejercicio3;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

public class VisitaOslo {

    public static ListaGenerica<String> paseoEnBici (Grafo<String> lugares, String destino, int maxTiempo, ListaGenerica<String> lugaresRestringidos){
        ListaGenerica<String> respuesta = new ListaEnlazadaGenerica<String>();
        int enLaCiudad = 0;
        int dirComienzo = 0;
        ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
        vertices.comenzar();
        while ((!vertices.fin()) && (enLaCiudad < 2)){
            Vertice<String> actual = vertices.proximo();
            if (actual.dato().equals("Montevideo")){
                dirComienzo = actual.getPosicion();
                enLaCiudad++;
            } else if (actual.dato().equals(destino)){
                enLaCiudad++;
            }
        }

        if (enLaCiudad == 2){
            boolean [] marca = new boolean [vertices.tamanio() + 1];
            ListaGenerica<String> caminoActual = new ListaEnlazadaGenerica<String> ();

            buscarPaseoEnBici (dirComienzo, destino, 0, maxTiempo, caminoActual, respuesta, lugares, lugaresRestringidos, marca) ;
        }


        return respuesta;
    }

    private static boolean buscarPaseoEnBici(int dirActual, String destino, int tiempoAct, int maxTiempo, ListaGenerica<String> caminoActual, ListaGenerica<String> respuesta, Grafo<String> mapa, ListaGenerica<String> lugaresRestringidos, boolean[] marca) {
        Vertice<String> actual = mapa.vertice(dirActual);
        caminoActual.agregarFinal(actual.dato());
        marca[dirActual] = true;
        boolean encontrado = false;
        if (actual.dato().equals(destino)){
            clonarLista (respuesta, caminoActual);
            encontrado = true;
        } else{
            ListaGenerica<Arista<String>> aristasAdy = mapa.listaDeAdyacentes(actual);
            aristasAdy.comenzar();
            while ((!encontrado) && (!aristasAdy.fin())){
                Arista<String> adyacente = aristasAdy.proximo();
                if ((!marca[adyacente.verticeDestino().getPosicion()]) && ((tiempoAct + adyacente.peso()) < maxTiempo) && (!restringido(adyacente.verticeDestino().dato(), lugaresRestringidos))){
                    encontrado = buscarPaseoEnBici(adyacente.verticeDestino().getPosicion(), destino, (tiempoAct + adyacente.peso()), maxTiempo, caminoActual, respuesta, mapa, lugaresRestringidos, marca);
                    caminoActual.eliminarEn(caminoActual.tamanio());
                    marca[adyacente.verticeDestino().getPosicion()] = false;
                }
            }
        }
        return encontrado;
    }

    private static boolean restringido(String dato, ListaGenerica<String> lugaresRestringidos) {
        lugaresRestringidos.comenzar();
        System.out.println("Checkea " + dato);
        boolean encontrado = false;
        while ((!encontrado) && (!lugaresRestringidos.fin())){
            String actual = lugaresRestringidos.proximo();
            if (actual.equals(dato)){
                encontrado = true;
            }
            System.out.println("Checkea " + actual + ' ' + encontrado);
        }
        return encontrado;
    }

    private static void clonarLista(ListaGenerica<String> respuesta, ListaGenerica<String> actual) {
        respuesta.comenzar();
        while (!respuesta.esVacia()){
            respuesta.eliminarEn(respuesta.tamanio());
        }
        actual.comenzar();
        while (!actual.fin()){
            respuesta.agregarFinal(actual.proximo());
        }

    }


    public static ListaGenerica<String> paseoIncluyendo (Grafo<String> grafo, String comienzo, String destino, int maxTiempo, ListaGenerica<String> ciudadesIncluidas ){
        ListaEnlazadaGenerica<String> respuesta = new ListaEnlazadaGenerica<String> ();
        ListaGenerica<Vertice<String>> vertices = grafo.listaDeVertices();
        vertices.comenzar();
        int encontrados = 0;
        int posComienzo =  0;
        boolean [] incluidos = new boolean [vertices.tamanio() + 1] ;
        while ((!vertices.fin())){
            Vertice<String> actual = vertices.proximo();
            if (ciudadesIncluidas.incluye(actual.dato())){
                incluidos [actual.getPosicion()] = true;
            }
            if (comienzo.equals(actual.dato())){
                posComienzo = actual.getPosicion();
                encontrados++;
            }
            if (destino.equals(actual.dato())){
                encontrados++;
            }

        }
        if (encontrados == 2){
            boolean [] marca = new boolean [vertices.tamanio() + 1];
            ListaGenerica<String> camActual = new ListaEnlazadaGenerica<String>();
            buscarPaseoIncluyendo (posComienzo, destino, 0, maxTiempo, camActual, respuesta, grafo, 0, ciudadesIncluidas.tamanio(), incluidos, marca);
            }
        return respuesta;
        }

    private static int buscarPaseoIncluyendo (int pos, String destino, int actTiempo, int maxTiempo, ListaGenerica<String> camActual, ListaGenerica<String> respuesta, Grafo<String> grafo, int actIncuidos, int totalInluidos, boolean[] incluidos, boolean [] marca){
        Vertice<String> actual = grafo.vertice(pos);
        marca[pos] = true;
        if (incluidos[pos]){
            actIncuidos++;
        }
        camActual.agregarFinal(actual.dato());


        if (actual.dato().equals(destino)){
            System.out.println(actTiempo);
            if (actIncuidos == totalInluidos){
                clonarLista3(respuesta, camActual);
                maxTiempo = actTiempo;

            }
        }else {
            ListaGenerica<Arista<String>> aristaAdy = grafo.listaDeAdyacentes(actual);
            aristaAdy.comenzar();

            while (!aristaAdy.fin()) {
                Arista<String> arista = aristaAdy.proximo();
                int posAct = arista.verticeDestino().getPosicion();
                if ((!marca[posAct]) && ((actTiempo + arista.peso()) < maxTiempo)){
                    maxTiempo = buscarPaseoIncluyendo(posAct, destino, (actTiempo + arista.peso()), maxTiempo, camActual, respuesta, grafo, actIncuidos, totalInluidos, incluidos, marca);
                }
            }
        }
        marca[pos] = false;
        camActual.eliminarEn(camActual.tamanio());
        return maxTiempo;
    }

    private static void clonarLista3(ListaGenerica<String> respuesta, ListaGenerica<String> camActual) {
        respuesta.comenzar();
        while (!respuesta.esVacia()){
            respuesta.eliminarEn(respuesta.tamanio());
        }
        camActual.comenzar();
        while (!camActual.fin()){
            respuesta.agregarFinal(camActual.proximo());
        }
    }


}
