/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author julio
 */
public class Profesor {
      private String nombre;
    private String apellido;
    private String apellido_materno;
    private String matricula;
    private String password;
    private String email;
    private String asignatura;
    private String nivel_educativo;
    private int id;
    private int id_asignatura;

    public Profesor(String nombre, String apellido, String apellido_materno, String matricula, String password, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.apellido_materno = apellido_materno;
        this.matricula = matricula;
        this.password = password;
        this.email = email;
    }
    public Profesor(){
        
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

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public String getNivel_educativo() {
        return nivel_educativo;
    }

    public void setNivel_educativo(String nivel_educativo) {
        this.nivel_educativo = nivel_educativo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_asignatura() {
        return id_asignatura;
    }

    public void setId_asignatura(int id_asignatura) {
        this.id_asignatura = id_asignatura;
    }

    @Override
    public String toString() {
        return "Profesor{" + "nombre=" + nombre + ", apellido=" + apellido + ", apellido_materno=" + apellido_materno + ", matricula=" + matricula + ", password=" + password + ", email=" + email + ", asignatura=" + asignatura + ", nivel_educativo=" + nivel_educativo + ", id=" + id + '}';
    }

 
   
    
    
}
