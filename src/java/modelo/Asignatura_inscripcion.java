
package modelo;


public class Asignatura_inscripcion {
     private String nombre;
    private String apellido;
    private String apellido_materno;
    private String matricula;
    private String password;
    private String email;
   private String estatus;
    private int id;
    private String tipo_usuario;
    private String asignatura;
public Asignatura_inscripcion(){
    
}
    public Asignatura_inscripcion(String nombre, String apellido, String apellido_materno, String matricula, String password, String email, String tipo_usuario, String asignatura) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.apellido_materno = apellido_materno;
        this.matricula = matricula;
        this.password = password;
        this.email = email;
        this.tipo_usuario = tipo_usuario;
        this.asignatura = asignatura;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
