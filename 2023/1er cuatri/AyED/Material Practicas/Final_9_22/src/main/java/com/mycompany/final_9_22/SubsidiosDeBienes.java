/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.final_9_22;

/**
 *
 * @author Juli
 */
public class SubsidiosDeBienes extends Subsidios {
    
    private Bienes [] Bienes;
    private int dimL;
    private int dimF;


    public SubsidiosDeBienes( int dimF, String NombreIvestigador, String NombreTrabajo, String Fecha) {
        super(NombreIvestigador, NombreTrabajo, Fecha);
        this.Bienes = new Bienes[dimF];
        this.dimL= 0;
        this.dimF = dimF;
    }
    
    
    
    public boolean agregarBien (Bienes Bien){
        if (dimL < Bienes.length) {
            Bienes[dimL++] = Bien;
            
        } else {
            return false;
        }
        
        return true;
    }
    
    public boolean agregarBien (String Descripcion, int Cantidad, double CostoPorUnidad){
        if (dimL < Bienes.length){
            Bienes bien = new Bienes(Descripcion, Cantidad, CostoPorUnidad);
            
            Bienes [dimL++] = bien;
            return true;
        }
        return false;
    }

    @Override
    public double montoTotalSubsidio() {
        int i;
        double suma = 0;
        for (i=0; i < Bienes.length; i++) {
            suma+= Bienes[i].CostoFinal();
        }
        return suma;
    }

    @Override
    public String toString() {
        String StringBienes = "";
        int i;
        for (i=0; i < dimL; i++){
            StringBienes= StringBienes + " " + Bienes[i].toString();
            
        }
        
        return super.toString() + " con un monto " + montoTotalSubsidio() + "Descripcion de los bienes: " + StringBienes ;
    }

   
    
    
    
    
    
}
