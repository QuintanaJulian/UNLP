/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author juliq
 */
public class Circulo extends Figura{
     private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public double calcularArea() {
        double aux= (2 * 3.1416 * getRadio() * getRadio() );
        return aux;
    }

    public double calcularPerimetro() {
        double aux= (3.1416 * getRadio() * getRadio());
        return aux;
    }

    public String toString() {
        String aux = (super.toString() + " Radio de: " + getRadio() );
        return aux;
    }

    
    

}
