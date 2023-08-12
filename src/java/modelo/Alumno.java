
package modelo;


public class Alumno {
    private String nombre;
    private String apellido;
    private String apellido_materno;
    private String matricula;
    private String password;
    private String email;
    private String turno;
    private String nivel_educativo;
    private String grupo;
    private String tipo_usuario;
private int id;
    public Alumno(String nombre, String apellido, String apellido_materno, String matricula, String password, String email, String turno, String nivel_educativo, String grupo, String tipo_usuario) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.apellido_materno = apellido_materno;
        this.matricula = matricula;
        this.password = password;
        this.email = email;
        this.turno = turno;
        this.nivel_educativo = nivel_educativo;
        this.grupo = grupo;
        this.tipo_usuario = tipo_usuario;
    }

    @Override
    public String toString() {
        return "alumno{" + "nombre=" + nombre + ", apellido=" + apellido + ", apellido_materno=" + apellido_materno + ", matricula=" + matricula + ", password=" + password + ", email=" + email + ", turno=" + turno + ", nivel_educativo=" + nivel_educativo + ", grupo=" + grupo + ", tipo_usuario=" + tipo_usuario + '}';
    }

    public Alumno() {
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

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getNivel_educativo() {
        return nivel_educativo;
    }

    public void setNivel_educativo(String nivel_educativo) {
        this.nivel_educativo = nivel_educativo;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
