/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e5;

import tema4.*;

/**
 *
 * @author Juli
 */
public class Triangulo extends Figura {
    private double lado1, lado2, lado3;
    
    public Triangulo (String unCR, String unCL, double lado1, double lado2, double lado3) {
        super(unCR, unCL);
        setLado1 (lado1);
        setLado2 (lado2);
        setLado3 (lado3);
    } 
    public double getLado1 () {
        return lado1;
    }

    public void setLado1 (double algunLado) {
        this.lado1 = algunLado;
    }    
    

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    
    public double calcularArea() {
        double aux = ((getLado1() * getLado2()) / 2);
        return aux;
    }

    
    public double calcularPerimetro() {
        double aux = (getLado1() + getLado2() + getLado3());
        return aux;
    }
    
     
    
    public String toString () {
        String aux = (super.toString() + " lados de: " + getLado1() + ", " + getLado2() + " y " + getLado3() );
        return aux;
        
    }
    
    
}
