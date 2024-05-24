package paquete;

public class Estudiante {
    private String Nombre;
    private String Apellido;
    private Integer Comision;
    private String Email;
    private String Direccion;


    public String tusDatos (){
        return "El profesor " + getApellido() + ' ' + getNombre() + " profesor de la catedra " + getComision() + " con direccion en " + getDireccion() + " con mail de contacto: " + getEmail();
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

    public Integer getComision() {
        return Comision;
    }

    public void setComision(Integer comision) {
        Comision = comision;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String direccion) {
        Direccion = direccion;
    }
}
