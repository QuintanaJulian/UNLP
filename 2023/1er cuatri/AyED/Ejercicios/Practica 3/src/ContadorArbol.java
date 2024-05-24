import tp02.ejercicio1.ListaDeEnterosEnlazada;
import tp03.ejercicio1.ArbolBinario;

public class ContadorArbol {
    private ArbolBinario<Integer> AB;
    private ArbolBinario<Integer> ABD;
    private ArbolBinario<Integer> ABI;

    public ArbolBinario<Integer> getABD() {
        return AB.getHijoDerecho();
    }

    public ArbolBinario<Integer> getABI() {
        return AB.getHijoIzquierdo();
    }

    /*public ListaDeEnterosEnlazada numerosParesI (){
        ListaDeEnterosEnlazada LEE;
           if (!AB.esVacio()){
            if (((AB.getDato())% 2) == 0){
                LEE = addListaEnlazadaGenerica (AB.getDato());
            }
            if (AB.tieneHijoDerecho()){
                ABD = AB.getHijoDerecho();
                ABD.numerosParesI();
            }
            if (AB.tieneHijoIzquierdo()){
                ABI = AB.getHijoIzquierdo();
                ABI.numeroParesI();
            }
        }
           return LEE;
            ListaDeEnterosEnlazada LE;
        }*/

    public ListaDeEnterosEnlazada numerosParesP (){
        ListaDeEnterosEnlazada LEE = new ListaDeEnterosEnlazada();
        if (!AB.esVacio()){
            if (AB.tieneHijoDerecho()){
                ABD = AB.getHijoDerecho();
                getABD().numerosParesP();
                ABD.numerosParesP();
            }
            if (AB.tieneHijoIzquierdo()){
                ABI = AB.getHijoIzquierdo();
                LEE.agregarInicio (getABI().numerosParesP());
            }
            if (((AB.getDato())% 2) == 0){
                LEE.agregarInicio(AB.getDato());
            }
        }
        return LEE;
    }
        private static ListaDeEnterosEnlazada LEE;
        public ListaDeEnterosEnlazada agregarLEE (int dato, ListaDeEnterosEnlazada lista){
            lista.a
        }

}
