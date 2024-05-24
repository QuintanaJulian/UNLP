package tp03.ejercicio1;

public class PParcial1 {

    private boolean resultado;

    public boolean getResultado() {
        return resultado;
    }

    private void setResultado(boolean resultado) {
        this.resultado = resultado;
    }


    public boolean metodo (ArbolBinario<Integer> AB) {
        setResultado(false);

        if (AB != null) {
            setResultado(true);
            if (AB.tieneHijoIzquierdo() || AB.tieneHijoDerecho()) {
                metodoAux(AB);
            }
        }
        return getResultado();
    }

    private int metodoAux (ArbolBinario<Integer> AB){

        int valor = AB.getDato();
        if (getResultado()) {

            if ((AB.tieneHijoDerecho()) && (AB.tieneHijoIzquierdo())){
                int hijo1, hijo2;
                hijo1 = metodoAux(AB.getHijoIzquierdo());
                hijo2 = metodoAux(AB.getHijoDerecho());
                if (!(hijo1 == hijo2)) {
                    setResultado(false);
                }
                valor += hijo1;
            } else {
                if (AB.tieneHijoIzquierdo()) {
                    valor += metodoAux(AB.getHijoIzquierdo());
                }

                if (AB.tieneHijoDerecho()) {
                    valor += metodoAux(AB.getHijoDerecho());
                }
            }
        }
        return valor;
    }








    //devolver true si la suma de todos los caminos es igual
 /*   public boolean metodo (ArbolBinario<Integer> AB) {
        setResultado(false);

        if (AB != null) {
            setResultado(true);
            if (AB.tieneHijoIzquierdo() || AB.tieneHijoDerecho()) {
                metodoAux(AB);
            }
        }
        return getResultado();
    }

    private int metodoAux (ArbolBinario<Integer> AB){
        int hijo1 = 0, hijo2 = 0;

        if (getResultado()) {
            if (AB.tieneHijoIzquierdo()) {
                hijo1 = metodoAux(AB.getHijoIzquierdo());
            }
            if (AB.tieneHijoDerecho()) {
                hijo2 = metodoAux(AB.getHijoDerecho());
            }
            if (!(hijo1 == hijo2)) {
                setResultado(false);
            }

        }
        return hijo1;
        }*/


}
