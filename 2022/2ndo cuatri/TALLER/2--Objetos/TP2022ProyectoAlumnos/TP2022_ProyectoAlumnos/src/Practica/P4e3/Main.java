/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author juliq
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Personas nuevaP = new Personas ("Joaquin", 44519638, 20);
        
        Trabajadores nuevoT = new Trabajadores ("Seguridad","Sofia", 42956335, 24);
        
        
        System.out.println(nuevoT.toString());
        System.out.println (nuevaP.toString());
    }
    
}
