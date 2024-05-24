public abstract class clase {
    private int edad;
    private String nombre;

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public abstract int getEdadCalculada();

    public abstract String getCompilacion();

}
