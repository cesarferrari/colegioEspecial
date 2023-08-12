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
public class Servicios_escolares {
       private String nombre;
    private String apellido;
    private String apellido_materno;
    private String matricula;
    private String password;
    private String email;

    public Servicios_escolares(String nombre, String apellido, String apellido_materno, String matricula, String password, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.apellido_materno = apellido_materno;
        this.matricula = matricula;
        this.password = password;
        this.email = email;
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

    @Override
    public String toString() {
        return "Servicios_escolares{" + "nombre=" + nombre + ", apellido=" + apellido + ", apellido_materno=" + apellido_materno + ", matricula=" + matricula + ", password=" + password + ", email=" + email + '}';
    }
    
}
