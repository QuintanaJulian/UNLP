/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ppe16;

/**
 *
 * @author juliq
 */
public class Producto {
    int Codigo;
    double precioMayo;
    double precioMino;

    public Producto(int Codigo, double precioMayo, double precioMino) {
        this.Codigo = Codigo;
        this.precioMayo = precioMayo;
        this.precioMino = precioMino;
    }

    public int getCodigo() {
        return Codigo;
    }
    
    

    @Override
    public String toString() {
        
        return "Producto codigo= " + Codigo + ", precioMayo=" + precioMayo + ", precioMino=" + precioMino + '}';
    }
    
    
    
}
