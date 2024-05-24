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
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Entrenadores nuevoE = new Entrenadores (5, "Juan", 10.5, 4);
        
        System.out.println (nuevoE.toString());
 
        Jugadores nuevoJ = new Jugadores ( 20, 20, "Carlo", 35, 5 );
    
        System.out.println (nuevoJ.toString());
        
        System.out.println (nuevoJ.calcularSueldoACobrar());
        System.out.println (nuevoE.calcularSueldoACobrar());
    }
 }
