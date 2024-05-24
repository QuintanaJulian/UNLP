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
public class Mayoristas extends Compras {
    private int CUIT;

    public Mayoristas(int CUIT, int nroCompra, int CantCompras) {
        super(nroCompra, CantCompras);
        this.CUIT = CUIT;
    }

    @Override
    public double PrecioAPagar(int nProducto, String MinMay) {
        double aux = (super.PrecioAPagar(nProducto, MinMay) * 0.79);
        return aux;
    }
    
    
    @Override
    public String toString() {
        double Precio;
        double montoT = 0;
        int i;
        String aux;
        aux = "Nro: " + super.getNroCompra() + System.lineSeparator();
        for (i=0; i < super.getDimL(); i++) {
            Precio = this.PrecioAPagar(i, "Mayorista" );
            aux =(aux + System.lineSeparator() + "     | Codigo producto: " + super.getCodigo(i)+ "| precio: " + Precio);
            montoT= montoT + Precio;
        }
        return aux + System.lineSeparator() + "Con un coste total de: " + montoT ;
    }
    
    
}
