/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repasoej02;

/**
 *
 * @author fdiaz
 */
public class Auto {
    private String nombreD;
    private int patente;

    public Auto(String nombreD, int patente) {
        this.nombreD = nombreD;
        this.patente = patente;
    }

    public Auto() {
    }
    
    

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    public String getNombreD() {
        return nombreD;
    }

    public int getPatente() {
        return patente;
    }
    
    public String toString(){
        String aux;
        aux = " Nombre del duenio: " + nombreD + " Patente: " + patente;
        return aux;
    }
}
