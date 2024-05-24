/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e3;

/**
 *
 * @author juliq
 */
public class Personas {
    private String Nombre;
    private int DNI;
    private int Edad;

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return Edad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    public Personas(String Nombre, int DNI, int Edad) {
        this.Nombre = Nombre;
        this.DNI = DNI;
        this.Edad = Edad;
    }

    public Personas() {
    }
    
    

    public String toString() {
        return "Personas " + "Nombre=" + Nombre + ", DNI=" + DNI + ", Edad=" + Edad;
    }
    
    
}
