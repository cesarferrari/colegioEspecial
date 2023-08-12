/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Alumno;
import servlets.servRegistrarse;


public class AlumnoDao implements CRUD{
Conexion con= new Conexion();
Alumno alumn= new Alumno();
Connection cnx=con.conectar();
PreparedStatement pst;
ResultSet rs;
 String[] sql={"select* from alumno where matricula=? and password=?","select* from profesor where matricula=? and password=?",
            "select* from servicios_escolares where matricula=? and password=?"};
    @Override
    public int mostrarAlumno(Alumno al) {
        int alumno=0;
       
    try {
             pst=cnx.prepareStatement(sql[0]);
        pst.setString(1, al.getMatricula());
        pst.setString(2, al.getPassword());
        rs=pst.executeQuery();
        
        if (rs.next()) {
            rs.getString("matricula");
           rs.getString("password");
            
            alumno=alumno+1;
            
        }
           
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    }
   
   
    return alumno;
    }
 public int mostrarSE(Alumno al) {
        int alumno=0;
       
    try {
             pst=cnx.prepareStatement(sql[2]);
        pst.setString(1, al.getMatricula());
        pst.setString(2, al.getPassword());
        rs=pst.executeQuery();
        
        if (rs.next()) {
            rs.getString("matricula");
           rs.getString("password");
            
            alumno=alumno+1;
            
        }
           
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    
 }
            
   
    return alumno;
    }
 
 public List showAlumn(){
     List<Alumno>alu=new ArrayList();
    try {
        pst=cnx.prepareStatement("select* from alumno where tipo_usuario!='alumno' or tipo_usuario is null");
        rs=pst.executeQuery();
        while (rs.next()) {
            Alumno alumno= new Alumno();
            alumno.setNombre(rs.getString("nombre"));
            alumno.setApellido(rs.getString("apellidoP"));
            alumno.setApellido_materno(rs.getString("apellidoM"));
            alumno.setEmail(rs.getString("email"));
            alumno.setMatricula(rs.getString("matricula"));
            alumno.setGrupo(rs.getString("grupo"));
            alumno.setNivel_educativo(rs.getString("nivel_educativo"));
            alumno.setTurno(rs.getString("turno"));
            alumno.setTipo_usuario(rs.getString("tipo_usuario"));
             alumno.setId(rs.getInt("id"));
            alu.add(alumno);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    }
     return alu;
 }
  public List showAlumn(String grupo,String nivel){
     List<Alumno>alu=new ArrayList();
    try {
        pst=cnx.prepareStatement("select* from alumno where grupo='"+grupo+"' and nivel_educativo='"+nivel+"'");
        rs=pst.executeQuery();
        while (rs.next()) {
            Alumno alumno= new Alumno();
            alumno.setNombre(rs.getString("nombre"));
            alumno.setApellido(rs.getString("apellidoP"));
            alumno.setApellido_materno(rs.getString("apellidoM"));
            alumno.setEmail(rs.getString("email"));
            alumno.setMatricula(rs.getString("matricula"));
            alumno.setGrupo(rs.getString("grupo"));
            alumno.setNivel_educativo(rs.getString("nivel_educativo"));
            alumno.setTurno(rs.getString("turno"));
            alumno.setTipo_usuario(rs.getString("tipo_usuario"));
            alumno.setId(rs.getInt("id"));
            alu.add(alumno);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    }
     return alu;
 }
   public List showAlumn(String id){
     List<Alumno>alu=new ArrayList();
     int id_alumno=Integer.parseInt(id);
    try {
        pst=cnx.prepareStatement("select* from alumno where id="+id_alumno);
        rs=pst.executeQuery();
        while (rs.next()) {
            Alumno alumno= new Alumno();
            alumno.setNombre(rs.getString("nombre"));
            alumno.setApellido(rs.getString("apellidoP"));
            alumno.setApellido_materno(rs.getString("apellidoM"));
            alumno.setEmail(rs.getString("email"));
            alumno.setMatricula(rs.getString("matricula"));
            alumno.setGrupo(rs.getString("grupo"));
            alumno.setNivel_educativo(rs.getString("nivel_educativo"));
            alumno.setTurno(rs.getString("turno"));
            alumno.setTipo_usuario(rs.getString("tipo_usuario"));
             alumno.setId(rs.getInt("id"));
            alu.add(alumno);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    }
     return alu;
 }
  public int mostrarProfesor(Alumno al) {
        int alumno=0;
       
    try {
             pst=cnx.prepareStatement(sql[1]);
        pst.setString(1, al.getMatricula());
        pst.setString(2, al.getPassword());
        rs=pst.executeQuery();
        
        if (rs.next()) {
            rs.getString("matricula");
           rs.getString("password");
            
            alumno=alumno+1;
            
        }
            
    } catch (SQLException ex) {
        Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, ex);
    }
   
    return alumno;
    }
    @Override
    public boolean updateAlumno(Alumno al) {
        Connection cnx=con.conectar();
        
        try{
            pst=cnx.prepareStatement("update alumno set nombre=?,apellidoP=?,apellidoM=?,email=?,grupo=?,tipo_usuario=?,nivel_educativo=?,turno=? where matricula=?");
            pst.setString(1,al.getNombre());
            pst.setString(2,al.getApellido());
            pst.setString(3,al.getApellido_materno());
            pst.setString(4,al.getEmail());
            pst.setString(5,al.getGrupo());
            pst.setString(6,al.getTipo_usuario());
            pst.setString(7,al.getNivel_educativo());
            pst.setString(8,al.getTurno());
            pst.setString(9,al.getMatricula());
            pst.executeUpdate();
            return true;
        }catch(Exception e){
             Logger.getLogger(AlumnoDao.class.getName()).log(Level.SEVERE, null, e);
             return false;
        }
       
    }

    @Override
    public boolean inserAlumno(Alumno al) {
           try {
                 pst=cnx.prepareStatement("insert into alumno(nombre,apellidoP,apellidoM,matricula,email,password)values(?,?,?,?,?,?)");
                pst.setString(1, al.getNombre());
                 pst.setString(2, al.getApellido());
                  pst.setString(3, al.getApellido_materno());
                   pst.setString(4, al.getMatricula());
                    pst.setString(5, al.getEmail());
                     pst.setString(6, al.getPassword());
                    int up= pst.executeUpdate();
                    if(up>0){
                        return true;
                    }else{
                        return false;
                    }
                     
            } catch (SQLException ex) {
                Logger.getLogger(servRegistrarse.class.getName()).log(Level.SEVERE, null, ex);
                    return false;            
            }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
    }

    @Override
    public boolean deleteAlumno(Alumno al) {
        return true;
    }
    
}
