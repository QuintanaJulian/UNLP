public class hijo extends clase{

    public hijo () {
    }

    public hijo (int edad,String nombre){
        setEdad(edad);
        setNombre(nombre);
    }


    @Override
    public int getEdadCalculada() {
        int valorActual = getEdad() * 5;
        System.out.println(valorActual);
        return valorActual;

    }

    @Override
    public String getCompilacion() {
        String respuesta= getNombre() + " tiene una edad de " + getEdad();
        System.out.println (respuesta);
        return respuesta;
    }


}
