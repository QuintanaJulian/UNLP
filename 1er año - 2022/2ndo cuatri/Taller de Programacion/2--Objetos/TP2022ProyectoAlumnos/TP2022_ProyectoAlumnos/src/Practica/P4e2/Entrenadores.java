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
public class Entrenadores extends Empleados {
    private int campeonatos;

    public Entrenadores(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
 
  
    public String toString() {
        return "Entrenador: "+ super.toString() + ", campeonatos= " + campeonatos ;       
     
    }

    public double calcularEfectividad() {
        double aux = (double) getCampeonatos() / getAntiguedad();
        return aux;
    }

    public double calcularSueldoACobrar() {
        double bono = 0;
        double aux= (double) this.getSueldo() * (1 + 0.10 * this.getAntiguedad());
        if (getCampeonatos()>= 10) 
            bono = 50000;
        else if (getCampeonatos() >= 5)
            bono = 30000;
        else if (getCampeonatos() >= 1)
            bono = 5000;
        return aux + bono;

    }

    




 

    
}
