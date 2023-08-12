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
import modelo.Profesor;
import servlets.servRegistrarse;

 
public class ProfesorDao {
   Conexion con = new Conexion();
   PreparedStatement pst;
   ResultSet rs;
    public List mostrarProfesorU(){
        Connection cnx=con.conectar();
        List<Profesor>prof=new ArrayList();
        try{
            pst=cnx.prepareStatement("select id_profesor,nombre,apellidoP,apellidoM,email from profesor");
            rs=pst.executeQuery();
            while (rs.next()) {
                Profesor pr= new Profesor();
                   pr.setId(rs.getInt("id_profesor"));
                pr.setNombre(rs.getString("nombre"));
                pr.setApellido(rs.getString("apellidoP"));
                pr.setApellido_materno(rs.getString("apellidoM"));
                pr.setEmail(rs.getString("email"));
                prof.add(pr);
                }
            }catch(Exception e){
            System.out.println(e);
        }finally{
            try{
                cnx.close();
                rs.close();
            }catch(Exception ex){
                System.out.println(ex);
            }
        }
        return prof;
    }
    public List mostrarProfesor(){
        Connection cnx=con.conectar();
        List<Profesor>prof=new ArrayList();
        try{
            pst=cnx.prepareStatement("select prof.id_profesor,asig.id_asignatura,asig.asignatura,asig.nivel_educativo,prof.nombre,prof.apellidoP,prof.apellidoM"
                    + " ,prof.email,prof.matricula from asignatura  asig inner join profesor prof on asig.id_profesor=prof.id_profesor;");
            rs=pst.executeQuery();
            while (rs.next()) {
                Profesor pr= new Profesor();
                pr.setNombre(rs.getString("prof.nombre"));
                pr.setApellido(rs.getString("prof.apellidoP"));
                pr.setApellido_materno(rs.getString("prof.apellidoM"));
                pr.setEmail(rs.getString("prof.email"));
                pr.setMatricula(rs.getString("prof.matricula"));
                pr.setNivel_educativo(rs.getString("asig.nivel_educativo"));
                pr.setAsignatura(rs.getString("asig.asignatura"));
                pr.setId(rs.getInt("prof.id_profesor"));
               pr.setId_asignatura(rs.getInt("asig.id_asignatura"));
                prof.add(pr);
                
            }
            
        }catch(Exception e){
            System.out.println(e);
        }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
        return prof;
    }
            public List mostrarProfesor(String matricula){
        Connection cnx=con.conectar();
        List<Profesor>prof=new ArrayList();
        try{
            pst=cnx.prepareStatement("select distinct prof.id_profesor,asig.id_asignatura,asig.asignatura,asig.nivel_educativo,prof.nombre,prof.apellidoP,prof.apellidoM"
                    + " ,prof.email,prof.matricula from asignatura  asig inner join profesor prof on asig.id_profesor=prof.id_profesor where prof.matricula='"+matricula+"'");
            rs=pst.executeQuery();
            while (rs.next()) {
                Profesor pr= new Profesor();
                pr.setNombre(rs.getString("prof.nombre"));
                pr.setApellido(rs.getString("prof.apellidoP"));
                pr.setApellido_materno(rs.getString("prof.apellidoM"));
                pr.setEmail(rs.getString("prof.email"));
                pr.setMatricula(rs.getString("prof.matricula"));
                pr.setNivel_educativo(rs.getString("asig.nivel_educativo"));
                pr.setAsignatura(rs.getString("asig.asignatura"));
                pr.setId(rs.getInt("prof.id_profesor"));
                prof.add(pr);
                
            }
            
        }catch(Exception e){
            System.out.println(e);
        }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
        return prof;
    }
        public List mostrarProfesorAsig(String matricula){
        Connection cnx=con.conectar();
        List<Profesor>prof=new ArrayList();
        try{
            pst=cnx.prepareStatement("select  prof.id_profesor,asig.id_asignatura,asig.asignatura,asig.nivel_educativo,prof.nombre,prof.apellidoP,prof.apellidoM"
                    + " ,prof.email,prof.matricula from asignatura  asig inner join profesor prof on asig.id_profesor=prof.id_profesor where asig.id_asignatura='"+matricula+"'");
            rs=pst.executeQuery();
            while (rs.next()) {
                Profesor pr= new Profesor();
                pr.setNombre(rs.getString("prof.nombre"));
                pr.setApellido(rs.getString("prof.apellidoP"));
                pr.setApellido_materno(rs.getString("prof.apellidoM"));
                pr.setEmail(rs.getString("prof.email"));
                pr.setMatricula(rs.getString("prof.matricula"));
                pr.setNivel_educativo(rs.getString("asig.nivel_educativo"));
                pr.setAsignatura(rs.getString("asig.asignatura"));
                pr.setId(rs.getInt("prof.id_profesor"));
                prof.add(pr);
                
            }
            
        }catch(Exception e){
            System.out.println(e);
        }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
        return prof;
    }
        
       
          public String matriculaRepeat(String matricula){
            String retorna="";
            Connection cnx=con.conectar();
            String[]ciclo=new String[3];
            ciclo[0]="select* from alumno where matricula='"+matricula+"'";
            ciclo[1]="select* from profesor where matricula='"+matricula+"'";
            ciclo[2]="select* from servicios_escolares where matricula='"+matricula+"'";
            try{
                for (int i = 0; i < ciclo.length; i++) {
                      pst=cnx.prepareStatement(ciclo[i]);
                rs=pst.executeQuery();
                while (rs.next()) {
                    retorna=rs.getString("matricula");
                }
                }
            }catch(Exception e){
                System.out.println(e);
            }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
            
            return retorna;
        }
            public String emailRepeat(String email){
            String retorna="";
            Connection cnx=con.conectar();
            String[]ciclo=new String[3];
            ciclo[0]="select* from alumno where email='"+email+"'";
            ciclo[1]="select* from profesor where email='"+email+"'";
            ciclo[2]="select* from servicios_escolares where email='"+email+"'";
            try{
                for (int i = 0; i < ciclo.length; i++) {
                      pst=cnx.prepareStatement(ciclo[i]);
                rs=pst.executeQuery();
                while (rs.next()) {
                    retorna=rs.getString("email");
                }
                }
            }catch(Exception e){
                System.out.println(e);
            }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
            
            return retorna;
        }
           public String insertProfesor(Profesor prof) {
               Connection cnx=con.conectar();
           try {
               
             if(!matriculaRepeat(prof.getMatricula()).equalsIgnoreCase("")){
                return "matricula";
             }else if(!emailRepeat(prof.getEmail()).equalsIgnoreCase("")){
                 return "email";
             }else{
                   pst=cnx.prepareStatement("insert into profesor(nombre,apellidoP,apellidoM,matricula,email,password)values(?,?,?,?,?,0000)");
                 pst.setString(1, prof.getNombre());
                   pst.setString(2, prof.getApellido());
                     pst.setString(3, prof.getApellido_materno());
                    pst.setString(4, prof.getMatricula());
                       pst.setString(5, prof.getEmail());
                     pst.executeUpdate();
                     return "succes";
             }
              } catch (SQLException ex) {
                Logger.getLogger(servRegistrarse.class.getName()).log(Level.SEVERE, null, ex);
                    return "error";            
            }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
    }
}
