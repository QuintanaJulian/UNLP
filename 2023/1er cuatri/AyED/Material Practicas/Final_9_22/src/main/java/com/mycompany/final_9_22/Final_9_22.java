/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.final_9_22;

/**
 *
 * @author Juli
 */
public class Final_9_22 {

    public static void main(String[] args) {
        
        SubsidiosDeBienes SB = new SubsidiosDeBienes(3, "Juan", "Contador", "Hoy");
        SB.agregarBien("Casa", 4, 10);
        SB.agregarBien("Auto", 3, 10);
        SB.agregarBien("Muebles", 3, 10);
        
        System.out.println(SB.montoTotalSubsidio());
        System.out.println(SB.toString());
        
        
        SubsidiosDeEstadia SE = new SubsidiosDeEstadia("Hawai", 20.6, 10, 10.5, "Oscar", "Estudio de aves", "Ayer" );
        System.out.println(SE.montoTotalSubsidio());
        System.out.println(SE.toString());
       
    }
}
