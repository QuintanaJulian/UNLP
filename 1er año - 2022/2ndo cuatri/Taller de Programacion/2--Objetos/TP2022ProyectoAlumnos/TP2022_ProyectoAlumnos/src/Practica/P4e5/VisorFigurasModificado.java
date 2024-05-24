/*  
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e5;

/**
 *
 * @author juliq
 */
public class VisorFigurasModificado {
    private int guardadas = 0;
    private int capacidadMaxima = 5;
    private Figura [] V;
    
    public  VisorFigurasModificado(){
    //    this.V = new [5];
        guardadas = 0;
        V = new Figura [capacidadMaxima];
    }
    
    public void guardar(Figura f){
        if (quedaEspacio() == true) {
            V[guardadas]= f;
            guardadas++;
        }
                
    }
    
    public boolean quedaEspacio(){
        if (guardadas <= capacidadMaxima)
            return true;
        else return false;
    }
        
    public void mostrar(){
        int j;
        for ( j=0; j<=capacidadMaxima; j++)
            System.out.println (V[j].toString());
    }

    public int getGuardadas() {
        return guardadas;
    }
   
} 