package tp02.ejercicio2;

public class ColaGenerica<T>{

    private ListaGenerica<T>  dato;

    public ColaGenerica() {
        dato = new ListaEnlazadaGenerica<T>();
    }

    public void encolar (T nuevo){
        this.dato.agregarFinal(nuevo);
    }

    public  T desencolar (){
        T D= dato.elemento(1);
        dato.eliminarEn(1);
        return D;
    }

    public T tope (){
        return dato.elemento(1);
    }

    public boolean esVacia (){
        return dato.esVacia();
    }
}
