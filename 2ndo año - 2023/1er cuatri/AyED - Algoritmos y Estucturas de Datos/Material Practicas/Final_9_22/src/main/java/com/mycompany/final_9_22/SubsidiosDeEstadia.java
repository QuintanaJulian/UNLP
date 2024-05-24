/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.final_9_22;

/**
 *
 * @author Juli
 */
public class SubsidiosDeEstadia extends Subsidios{
    private String Destino;
    private double CostoViaje;
    private int CantDias;
    private double MontoHospedaje;

   public SubsidiosDeEstadia(String Destino, double Costo, int cantDias, double MontoHospedaje, String NombreIvestigador, String NombreTrabajo, String Fecha) {
        super(NombreIvestigador, NombreTrabajo, Fecha);
        this.Destino = Destino;
        this.CostoViaje = Costo;
        this.CantDias = cantDias;
        this.MontoHospedaje = MontoHospedaje;
    }
   
   
    
    
        
    @Override
    public double montoTotalSubsidio() {
        
        return (CostoViaje + (CantDias * MontoHospedaje));
    }

    @Override
    public String toString() {
        return super.toString() + ", monto total " + montoTotalSubsidio() + ", con destino en " + Destino + "  y una estadia de " + CantDias + " dias.";
    }
    
    
    
    
    
}
