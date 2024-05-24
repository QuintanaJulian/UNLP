
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores_resuelto {
  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        //Paso 3: Crear el vector para 15 double 
        int DF = 5;
        double [] vector = new double[DF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        int i; double suma=0;
        for (i=0; i<DF;i++){
           System.out.println("Ingrese altura del jugador:");
           vector[i]= Lector.leerDouble();
           suma=suma +vector[i]; 
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        double prom= suma / DF;
        System.out.println("Promedio: "+prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
         int cant=0;
         for (i=0; i<DF;i++){
              if (vector[i] > prom) cant++;
         }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de aluras que superan prom es: "+ cant);
    }
    
}
