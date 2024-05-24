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
public class Proyecto {
    private String Nombre;
    private int Codigo;
    private String Director;
    private Investigador [] Investigadores;
    private int dimL;
    private int maxInv = 50;

    public Proyecto(String Nombre, int Codigo, String Director) {
        this.Nombre = Nombre;
        this.Codigo = Codigo;
        this.Director = Director;
        Investigadores = new Investigador [maxInv];
    }
    
   void agregarInvestigador(Investigador unInvestigador){
// agregar un investigador al proyecto.
        if (dimL < maxInv) {
            this.Investigadores[dimL] = unInvestigador;
            dimL++;
        } else System.out.println ("Ya hay el maximo de investigadores");
}

    public int getCantInvestigadores() {
        return dimL;
    }
   
   
   
   double dineroTotalOtorgado() {
       //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
       //todos los subsidios otorgados de todos los investigadores)
       Investigador invActual;
       Subsidio subActual;
       int i, j;
       double  montoT = 0;
       for (i=0; i< getCantInvestigadores(); i++){
           invActual = Investigadores[i];
           for (j=0; i< invActual.getCantSubsidios(); i++){
               subActual= invActual.getSubsidio(j);
               if (subActual.isOtorgado() == true)
                   montoT= subActual.getMonto();
           }
       }
    return montoT;
   }

 void otorgarTodos(String nombre_completo){
    //otorgar todos los subsidios no-otorgados del investigador llamado
    //nombre_completo  
    String actual;
    int i = 0;
    actual = Investigadores[i].getNombre();
   while ((i < getCantInvestigadores()) && (!actual.equals(nombre_completo))) {
       i++;
       actual= Investigadores[i].getNombre();
       }
   if (actual.equals(nombre_completo)){
       Investigadores[i].setTrue();
   }
 }      
 
    
    public String toString() {
        String aux2;
        aux2 = "";
        int i;
        for (i=0; i < getCantInvestigadores(); i++){
                aux2= aux2 + Investigadores[i].toString();}
        
        String aux = "Proyecto{" + "Nombre=" + Nombre + ", Codigo=" + Codigo + ", Director=" 
                + Director + ", Investigadores=" + aux2 + '}';         
        return aux;
    }
 
 
        
 
        
 
}












