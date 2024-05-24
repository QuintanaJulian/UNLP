package tp03.ejercicio1;

public class Pparcial2 {
   /* private boolean Respuesta;


    public void setRespuesta (boolean Respuesta){
        this.Respuesta = Respuesta;
    }

    public boolean getRespuesta (){
        return Respuesta;
    }


    public boolean esDeSeleccion (ArbolGeneral<Integer> arbol){

        setRespuesta(true);
        if (arbol != null){
            if ((arbol.tieneHijoIzquierdo()) || (arbol.tieneHijoDerecho())){
                esDeSeleccionAux(arbol);
            }

        }
        return getRespuesta();
    }



    private int esDeSeleccionAux (ArbolGeneral<Integer> AG){
        if (getRespuesta()){
            ListaEnlazada<Integer> L = new ListaEnlazadaGenerica <Integer>();
            Integer minimo = 99999999;

            if (AG.tieneHijos()){
                ListaGenerica<ArbolGeneral<Integer> hijos = AG.getHijos();
                hijos.comenzar();
                while (!hijos.fin()){
                    if (hijos.getdato().tieneHijos()){
                        L.agregarFinal(esDeSeleccionAux(hijos.proximo()))
                    } else (L.agregarFinal(AG.proximo().getDato()))
                }

                L.comenzar();
                while (!L.fin()){
                    minimo = Math.min(minimo, L.proximo());
                }
                if (minimo != AG.getDato()){
                    setRespuesta(faalse);
                }
            }
            return AG.getDato();
        }
*/

    }