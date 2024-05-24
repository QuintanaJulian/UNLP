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
public class Estacionamiento {
    private String nombre;
    private int direcc;
    private int hApertura;
    private int hCierre;
    private int dimPisos;
    private int dimPlazas;
    private Auto [][] matrizAutos;

    public Estacionamiento(String nombre, int direcc) {
        this.nombre = nombre;
        this.direcc = direcc;
        this.hApertura = 8;
        this.hCierre = 21;
        this.dimPisos = 5;
        this.dimPlazas = 10;
        this.matrizAutos = new Auto[5][10];
    }

    public Estacionamiento(String nombre, int direcc, int hApertura, int hCierre, int dimPisos, int dimPlazas) {
        this.nombre = nombre;
        this.direcc = direcc;
        this.hApertura = hApertura;
        this.hCierre = hCierre;
        this.dimPisos = dimPisos;
        this.dimPlazas = dimPlazas;
        matrizAutos = new Auto[dimPisos][dimPlazas];
    } 
    

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDirecc(int direcc) {
        this.direcc = direcc;
    }

    public void sethApertura(int hApertura) {
        this.hApertura = hApertura;
    }

    public void sethCierre(int hCierre) {
        this.hCierre = hCierre;
    }

    public void setMatrizAutos(Auto[][] matrizAutos) {
        this.matrizAutos = matrizAutos;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDirecc() {
        return direcc;
    }

    public int gethApertura() {
        return hApertura;
    }

    public int gethCierre() {
        return hCierre;
    }

    public Auto[][] getMatrizAutos() {
        return matrizAutos;
    }
    
    public void registrarAuto(Auto a, int piso, int plaza){
        matrizAutos[piso-1][plaza-1] = a;
    }
    
    public String buscarAuto(int patente){
        
        for(int i=0;i<dimPisos;i++){
            for(int j=0;j<dimPlazas;j++){
                if(matrizAutos[i][j].getPatente()==patente){
                    return "Piso: " + i + " Plaza: " + j;
                }
            }
        }
        return "Auto inexistente";
    }
    
    public String toString(){
        String aux = "";
        
        for(int i=0;i<dimPisos;i++){
            for(int j=0;j<dimPlazas;j++){
                aux = aux + "Piso " + (i+1) + " Plaza " + (j+1) + matrizAutos[i][j].toString() + "\n";  
            }
        }
        
        return aux;
    }
    
    public int autosEnPlaza(int Y){
        int cantAutos = 0;
        for(int i=0;i<dimPisos;i++){
            if(matrizAutos[i][Y].getPatente()!=0){
                cantAutos++;
            }
        }
        return cantAutos;
    } 
    
}
