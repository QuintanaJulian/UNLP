package tp03.ejercicio1;


import tp02.ejercicio2.ListaGenerica;

public class Registro {
    private static int impares;

    private ListaGenerica<Integer> LEG;

    public void setImpares ( int impares){
        Registro.impares = impares;
    }

    public int getImpares() {
        return impares;
    }

    public ListaGenerica<Integer> getLEG() {
        return LEG;
    }

    public void setLEG(ListaGenerica<Integer> LEG) {
        this.LEG = LEG;
    }

    public  Registro (){

    }
    public  Registro (int impares, ListaGenerica<Integer> LEG){
        Registro.impares = impares;
        this.LEG = LEG;
    }


    public void addImpares (){
        Registro.impares++;
    }
}
