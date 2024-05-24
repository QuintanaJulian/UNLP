/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e2;

/**
 *
 * @author Juli
 */
public abstract class Empleados {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleados(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

      
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String toString() {
        return "nombre= " + nombre + ", sueldo= " + sueldo + ", antiguedad= " + antiguedad + ", efectividad: " + calcularEfectividad();
    }
 
    public abstract double calcularEfectividad ();
    
    public abstract double calcularSueldoACobrar () ;
        
        

}
