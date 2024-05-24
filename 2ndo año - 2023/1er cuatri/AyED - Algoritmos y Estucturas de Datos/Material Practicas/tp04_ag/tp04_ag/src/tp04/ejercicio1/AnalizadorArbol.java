package tp04.ejercicio1;

import tp02.ejercicio2.ColaGenerica;
import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;

public class AnalizadorArbol {

    public static int devolverMaximoPromedio (ArbolGeneral<AreaEmpresa> arbol){
        int maxPromedio = -9999;
        if (arbol != null) {

            maxPromedio = arbol.getDato().getTiempo();

            if (arbol.tieneHijos()) {

                ColaGenerica<ArbolGeneral<AreaEmpresa>> cola1 = new ColaGenerica<ArbolGeneral<AreaEmpresa>>();
                ColaGenerica<ArbolGeneral<AreaEmpresa>> cola2 = new ColaGenerica<ArbolGeneral<AreaEmpresa>>();
                ListaGenerica<ArbolGeneral<AreaEmpresa>> LEG = new ListaEnlazadaGenerica<ArbolGeneral<AreaEmpresa>>();
                ArbolGeneral<AreaEmpresa> AG;
                LEG = arbol.getHijos();
                LEG.comenzar();
                while (! LEG.fin()){
                    cola1.encolar(LEG.proximo());
                }
                while ((!cola1.esVacia()) || (!cola2.esVacia())) {
                    int suma = 0;
                    int cantidad = 0;
                    if (!cola1.esVacia()){
                        while (!cola1.esVacia()) {
                            AG = cola1.desencolar();
                            cantidad++;
                            suma += AG.getDato().getTiempo();
                            if (AG.tieneHijos()){
                                LEG = AG.getHijos();
                                LEG.comenzar();
                                while (! LEG.fin()) {
                                    cola2.encolar(LEG.proximo());
                                }
                            }
                        }
                    }else{
                        while (! cola2.esVacia()){
                            AG = cola2.desencolar();
                            cantidad++;
                            suma += AG.getDato().getTiempo();
                            if (AG.tieneHijos()){
                                LEG = AG.getHijos();
                                LEG.comenzar();
                                while (! LEG.fin()){
                                    cola1.encolar (LEG.proximo());
                                }
                            }
                        }
                    }
                    maxPromedio = Math.max (maxPromedio, (suma / cantidad));

                    }


            }
        }
        return maxPromedio;
    }
}


//incluye()


/*

if (actual == true){
                        AG = cola1.desencolar();
                    } else { AG = cola2.desencolar();}

                    if ( AG )

 */