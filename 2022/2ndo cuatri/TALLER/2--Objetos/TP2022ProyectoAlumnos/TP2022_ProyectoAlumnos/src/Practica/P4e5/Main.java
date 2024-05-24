/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e5;



/**
 *
 * @author juliq
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
           VisorFigurasModificado visor = new VisorFigurasModificado();
        
    Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
    Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
    Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
    Cuadrado c3= new Cuadrado(30,"Amarillo","Oscuridad");
    Cuadrado c4= new Cuadrado(30,"Rojo","Negro");
    Cuadrado c5= new Cuadrado(30,"Cielo","Pasion");
    

    visor.guardar(c1);
    visor.guardar(r);
    visor.guardar(c2);
    visor.guardar(c3);
    visor.guardar(c4);
    System.out.println(visor.quedaEspacio());
    visor.guardar(c5);
    
    visor.mostrar();
        
    System.out.println("Este" + visor.getGuardadas());
    }
    
}
