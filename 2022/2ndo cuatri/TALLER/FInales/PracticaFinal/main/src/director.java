public class director {
    private String nombre;
    private int DNI;
    private int edad;
    private int antiguedad;

    public director(String nombre, int DNI, int edad, int antiguedad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    public String toString() {
        return "El director " + nombre +
                ", con DNI=" + DNI +
                ", edad" + edad +
                "y antiguedad " + antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getantiguedad() {
        return antiguedad;
    }

    public void setantiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
}
