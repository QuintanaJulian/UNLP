/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.final_9_22;

/**
 *
 * @author Juli
 */
public class Bienes {
    private String Descripcion;
    private int Cantidad;
    private double CostoUnidad;

    public Bienes(String Descripcion, int Cantidad, double CostoUnidad) {
        this.Descripcion = Descripcion;
        this.Cantidad = Cantidad;
        this.CostoUnidad = CostoUnidad;
    }
    
    public double CostoFinal (){
        return (Cantidad * CostoUnidad);
    }

    @Override
    public String toString() {
        return  "Descripcion= " + Descripcion + ", Cantidad= " + Cantidad + ", CostoUnidad= " + CostoUnidad;
    }
    
    
}
