import tp03.ejercicio1.ArbolBinario;

public class RedBinariaLlena {

    public int retardoReenvio (ArbolBinario<Integer> AB){
        int HD = 0;
        int HI = 0;
        if (AB.tieneHijoDerecho()){
            HD = retardoReenvio (AB.getHijoDerecho());
        }
        if (AB.tieneHijoIzquierdo()){
            HI = retardoReenvio(AB.getHijoIzquierdo());
        }
        int dato = 0;
        if (AB.esHoja()){
            dato = AB.getDato();
        }
        return (dato + (Math.max(HD,HI)));
    }

}
