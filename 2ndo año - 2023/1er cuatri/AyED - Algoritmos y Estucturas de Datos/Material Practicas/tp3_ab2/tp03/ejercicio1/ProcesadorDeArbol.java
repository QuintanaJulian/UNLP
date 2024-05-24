package tp03.ejercicio1;

import tp02.ejercicio2.*;

public class ProcesadorDeArbol {


    private ArbolBinario<Integer> AB;

    public void setAB(ArbolBinario<Integer> AB) {
        this.AB = AB;
    }

    public ProcesadorDeArbol(ArbolBinario<Integer> AB) {
        setAB(AB);
    }

    public ProcesadorDeArbol() {
    }

    public ArbolBinario<Integer> getAB() {
        return this.AB;
    }

    public Registro Procesar() {
        Registro datos = new Registro();
        //    ListaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer> ( );
        //      int impares = 0;

        ArbolBinario<Integer> ABaux = getAB();
        if (ABaux.tieneHijoIzquierdo()) {
            ProcesadorDeArbol hijo = new ProcesadorDeArbol(ABaux.getHijoIzquierdo());
            ListaGenerica<Integer> Laux = hijo.Procesar().getLEG();
            Laux.comenzar();
            while (!Laux.fin()) {
                datos.getLEG().agregarFinal(Laux.proximo());
            }
        }

        if (ABaux.tieneHijoDerecho()) {
            ProcesadorDeArbol hijo = new ProcesadorDeArbol(ABaux.getHijoDerecho());
            ListaGenerica<Integer> Laux = hijo.Procesar().getLEG();
            Laux.comenzar();
            while (!Laux.fin()) {
                datos.getLEG().agregarFinal(Laux.proximo());
            }
        }
        Integer dato = ABaux.getDato();
        if (((dato / 2) != 0)) {
            datos.addImpares();

            if (((ABaux.tieneHijoDerecho()) || (ABaux.tieneHijoIzquierdo())) && (!(ABaux.tieneHijoDerecho() && ABaux.tieneHijoIzquierdo()))) {
                datos.getLEG().agregarFinal(dato);
            }
        }
        //   System.out.println (impares);
        return datos;
    }



        public static ListaGenerica<ListaEnlazadaGenerica<Integer>> caminosPares (ArbolBinario<Integer> arbol){

            ListaGenerica<ListaEnlazadaGenerica<Integer>> SuperLista = new ListaEnlazadaGenerica<ListaEnlazadaGenerica<Integer>>();
            if (!arbol.esVacio()){
                ListaEnlazadaGenerica<Integer> ListaT = new ListaEnlazadaGenerica<Integer>();
                ListaT.agregarFinal(arbol.getDato());
                if (arbol.tieneHijoIzquierdo()) caminosParesAux (SuperLista, ListaT, arbol.getHijoIzquierdo());
                if (arbol.tieneHijoDerecho()) caminosParesAux (SuperLista, ListaT, arbol.getHijoDerecho());
            }
            return SuperLista;
        }

        private static void caminosParesAux (ListaGenerica<ListaEnlazadaGenerica<Integer>> SuperLista, ListaEnlazadaGenerica<Integer> ListaT, ArbolBinario<Integer> AB){

            ListaT.agregarFinal (AB.getDato());
            if (AB.esHoja()){
                if ((ListaT.tamanio() % 2) == 0){
                    ListaEnlazadaGenerica<Integer> ListaOK = (ListaEnlazadaGenerica<Integer>) ListaT.clonar();
                    SuperLista.agregarFinal(ListaOK);
                }
            } else {
                if (AB.tieneHijoIzquierdo()) caminosParesAux (SuperLista, ListaT, AB.getHijoIzquierdo());
                if (AB.tieneHijoDerecho()) caminosParesAux (SuperLista, ListaT, AB.getHijoDerecho());
            }
            ListaT.eliminarEn(ListaT.tamanio());
        }





    private boolean encontrado;
    //construir getters and setters de encontrado
    public boolean isEncontrado () {return encontrado;}
    public void setEncontrado (boolean encontrado){ this.encontrado = encontrado;}


    public ListaGenerica<Integer> resolver (ArbolBinario<Integer> ab, int min){
        ListaGenerica<Integer> Respuesta = new ListaEnlazadaGenerica<Integer>();
        setEncontrado(false);
        if (!ab.esVacio()){
            int pares = 0;
            resolverAux (Respuesta, ab, min, pares);
        }
        if (!isEncontrado()) Respuesta = null;
        return Respuesta;
    }

    private void resolverAux (ListaGenerica<Integer> Respuesta, ArbolBinario<Integer> AB, int min, int pares){
   //     if (!isEncontrado()){
            int dato = AB.getDato();
            Respuesta.agregarFinal(dato);
            if ((dato % 2) == 0) pares++;
            if (AB.esHoja()){
                if (min <= pares) setEncontrado(true);
            }else {
                if (AB.tieneHijoIzquierdo()) resolverAux(Respuesta, AB.getHijoIzquierdo(), min, pares);
                if ((AB.tieneHijoDerecho()) && (!isEncontrado())) resolverAux (Respuesta, AB.getHijoDerecho(), min, pares);
            }

            if ((dato % 2) == 0) pares--;
            if (!isEncontrado()) Respuesta.eliminarEn(Respuesta.tamanio());
   //     }
    }
}
