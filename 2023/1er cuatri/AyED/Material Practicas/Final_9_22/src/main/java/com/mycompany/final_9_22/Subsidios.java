/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.final_9_22;
/**
 *
 * @author Juli
 */
public abstract class Subsidios {
    private String NombreIvestigador;
    private String NombreTrabajo;
    private String Fecha;

    public Subsidios(String NombreIvestigador, String NombreTrabajo, String Fecha) {
        this.NombreIvestigador = NombreIvestigador;
        this.NombreTrabajo = NombreTrabajo;
        this.Fecha = Fecha;
    }
    
    
    public abstract double montoTotalSubsidio ();

    @Override
    public String toString() {
        return "El subsidio " + "del Ivestigador " + NombreIvestigador + ", sobre el trabajo " + NombreTrabajo + ", Fecha " + Fecha;
    }
    
    
    
}
    
    
