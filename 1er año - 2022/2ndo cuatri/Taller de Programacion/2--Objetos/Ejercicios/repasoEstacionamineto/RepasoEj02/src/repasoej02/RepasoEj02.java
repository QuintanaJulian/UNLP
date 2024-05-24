/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repasoej02;

 
public class RepasoEj02 {

    
    public static void main(String[] args) {
        
        Estacionamiento e = new Estacionamiento("Estacionamineto La Tortugita",25,8,22,3,3);
        
        Auto a1 = new Auto("federeico", 2354);
        Auto a2 = new Auto("luciana",8642);
        Auto a3 = new Auto("roberto", 8452);
        Auto a4 = new Auto("florencia", 1687);
        Auto a5 = new Auto("luis", 5976);
        Auto a6 = new Auto("miguelito", 3163);
        
        e.registrarAuto(a1, 1, 3);
        e.registrarAuto(a2, 2, 2);
        e.registrarAuto(a3, 3, 1);
        e.registrarAuto(a4, 1, 3);
        e.registrarAuto(a5, 2, 2);
        e.registrarAuto(a6, 3, 1);
        
        System.out.println(e.toString());
        
        System.out.println(e.autosEnPlaza(1));
        
        System.out.println(e.buscarAuto(3163));
    }
    
}
