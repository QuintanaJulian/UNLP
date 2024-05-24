package javaapplication1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Juli
 */
public class Investigador {
    private String Nombre;
    private int Categoria;
    private String Especialidad;
    private Subsidio [] Subsidios;
    private int maxSubsidios = 5;
    private int dimL;

    public Investigador(String Nombre, int Categoria, String Especialidad) {
        this.Nombre = Nombre;
        this.Categoria = Categoria;
        this.Especialidad = Especialidad;
        Subsidios = new Subsidio [maxSubsidios];
    }

    void agregarSubsidio(Subsidio unSubsidio) {
        // agregar un subsidio al investigador
        if (dimL < maxSubsidios){
            Subsidios[dimL]= unSubsidio;
            dimL++;
        } else System.out.println("Ya pediste todos los subsidios");
        
    }

     public int getCantSubsidios() {
        return dimL ;
    }

    Subsidio getSubsidio(int j) {
        return Subsidios[j];
    }

    public String getNombre() {
        return Nombre;
    }
     
    public void setTrue() {
        int i;
        for (i=0; i< getCantSubsidios(); i++){
            Subsidios[i].setOtorgado();
        }
    }
    
    public double valorSubsidios () {
        int i;
        double aux= 0;
        for (i=0; i< getCantSubsidios(); i++)
            if (Subsidios[i].isOtorgado())
                aux= aux + Subsidios[i].getMonto() ;
        return aux;
    }

    public String toString() {
        return "Investigador{" + "Nombre=" + Nombre + ", Categoria=" + Categoria + ", Especialidad=" + Especialidad + +'}';
    }


    
}
