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
public class Jugadores extends Empleados  {
    private int partidos;
    private int goles;

    public Jugadores(int partidos, int goles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public String toString() {
        return "Jugador: "+ super.toString() + ", partidos= " + partidos + ", goles= " + goles;
    }

    public double calcularEfectividad() {
        double aux= (double) getGoles() / 100  * getPartidos();
        return aux;
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux= (double) this.getSueldo() * (1 + 0.10 * this.getAntiguedad());
        if (calcularEfectividad() > 0.5 ) 
            aux = aux + getSueldo()  ;
        return aux;
    }
        
        
    
    
    
    
    
    
}
