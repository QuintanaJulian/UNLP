package javaapplication1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Juli
 */
public class Subsidio {
    private double Monto;
    private String Motivo;
    private boolean Otorgado;

    public Subsidio(double Monto, String Motivo) {
        this.Monto = Monto;
        this.Motivo = Motivo;
        this.Otorgado = false;
    }

    public double getMonto() {
        return Monto;
    }

    public boolean isOtorgado() {
        return Otorgado;
    }

    public void setOtorgado() {
        this.Otorgado = true;
    }

   
    
    
    
}
