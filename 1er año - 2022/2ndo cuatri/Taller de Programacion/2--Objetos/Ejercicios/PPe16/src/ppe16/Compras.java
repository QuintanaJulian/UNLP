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
public abstract class Compras {
    int nroCompra;
    Producto [] Compras;
    int DimF;
    int DimL= 0;

    public Compras(int nroCompra, int cantCompras) {
        this.nroCompra = nroCompra;
        this.DimF = cantCompras;
        Compras = new Producto [DimF];
    }

    public int getNroCompra() {
        return nroCompra;
    }

    public int getDimL() {
        return DimL;
    }
    
    
    
    
    public void agregarCompras (int Codigo, double precioMayo, double precioMino) {
        Producto newP;
        newP = new Producto( Codigo, precioMayo, precioMino);
        Compras[DimL]= newP;
        DimL++;
    }
    
    
    public double PrecioAPagar (int nProducto, String MinMay){
        Producto aux= Compras[nProducto];
        if (MinMay.equals("Minorista"))
            return aux.precioMino;
        else return aux.precioMayo;
        
    }       
    
    public int getCodigo (int aux) {
        return Compras[aux].getCodigo();
    }

    public String toString(String MinMay) {
        return "Compras{" + "nroCompra=" + nroCompra + ", Compras=" + Compras + ", DimF=" + DimF + ", DimL=" + DimL + '}';
    }
    
    
    
    
}
