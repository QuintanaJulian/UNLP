package paquete;

public class Profesor {
    private String Nombre;
    private String Apellido;
    private String Email;
    private int Catedra;
    private String Facultad;


    public String tusDatos (){
        return "El profesor " + getApellido() + ' ' + getNombre() + " profesor de la catedra " + getCatedra() + " de la facultad " + getFacultad() + " con mail de contacto: " + getEmail();
    }



    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String apellido) {
        Apellido = apellido;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public int getCatedra() {
        return Catedra;
    }

    public void setCatedra(int catedra) {
        Catedra = catedra;
    }

    public String getFacultad() {
        return Facultad;
    }

    public void setFacultad(String facultad) {
        Facultad = facultad;
    }
}
