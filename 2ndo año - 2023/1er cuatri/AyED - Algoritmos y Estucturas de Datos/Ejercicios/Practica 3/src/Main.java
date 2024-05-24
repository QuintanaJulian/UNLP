import tp03.ejercicio1.ArbolBinario;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");

        ArbolBinario AR1 = new ArbolBinario(3);
        ArbolBinario AR2 = new ArbolBinario(5);
        ArbolBinario AR3 = new ArbolBinario(9);
        ArbolBinario AR4 = new ArbolBinario(10);
        ArbolBinario AR5 = new ArbolBinario(15);
        ArbolBinario AR6 = new ArbolBinario(25);
        AR3.agregarHijoDerecho(AR4);
        AR3.agregarHijoIzquierdo(AR4);
        AR2.agregarHijoDerecho(AR5);
        AR1.agregarHijoDerecho(AR2);
        AR1.agregarHijoIzquierdo(AR3);
        AR1.getHijoIzquierdo().agregarHijoIzquierdo(AR6);
       // System.out.println( AR1.contarHojas());
        ArbolBinario ARI = new ArbolBinario();
      //  ARI = AR1.espejo();
        AR1.entreNiveles(4,4);
      //  System.out.println(ARI.getHijoDerecho().getHijoIzquierdo().getDato());
    }
}