package tp02.ejercicio2;

public class PilaGenerica<T>{
    private ListaGenerica<T> dato;

    public PilaGenerica (){
        dato = new ListaEnlazadaGenerica<T>();
    }

    public void apilar (T nuevo){
        dato.agregarInicio(nuevo);
    }
    public T desapilar (){
        T D = dato.elemento(1);
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
