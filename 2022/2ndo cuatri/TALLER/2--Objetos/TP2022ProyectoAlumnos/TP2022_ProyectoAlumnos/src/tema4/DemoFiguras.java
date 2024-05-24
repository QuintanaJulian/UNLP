/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Area: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
       
        
        Triangulo nuevoT= new Triangulo ("rojo", "azul", 1.2, 4.5, 6.1);
        
        System.out.println (nuevoT.toString());
        System.out.println (nuevoT.calcularPerimetro());
        
        Circulo nuevoC = new Circulo (4, "Rojo", "Verde");
        System.out.println (nuevoC.toString());
    }
    
    
    
}
