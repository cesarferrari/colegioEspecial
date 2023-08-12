/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import modelo.Alumno;

/**
 *
 * @author julio
 */
public interface CRUD {
    public int mostrarAlumno(Alumno al);
    public boolean updateAlumno(Alumno al);
    public boolean inserAlumno(Alumno al);
    public boolean deleteAlumno(Alumno al);
}
