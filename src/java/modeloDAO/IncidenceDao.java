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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import modelo.Incidence;
import modelo.Incidence_al;
import modelo.Incidence_prof;

/**
 *
 * @author julio
 */
public class IncidenceDao {
    
    Incidence inc= new Incidence();
    Conexion con = new Conexion();
    PreparedStatement pst;
    ResultSet rs;
    
     public List mostrarIncidence(String f1,String f2){
        Connection cnx=con.conectar();
        List<Incidence>inc_al= new ArrayList();
     String sql="select id_incidencia,p.nombre,p.apellidoP,p.apellidoM,incidencia,fecha from incidencia  inner join servicios_escolares p on "
             + "p.id_services=incidencia.id_se  where fecha between+'"+f1+"' and '"+f2+"'";
     
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
             Incidence al=new Incidence();
             al.setNombre(rs.getString("p.nombre"));
             al.setApellidoP(rs.getString("p.apellidoP"));
             al.setApellidoM(rs.getString("p.apellidoM"));
             al.setIncidence(rs.getString("incidencia"));
             al.setId(rs.getInt("id_incidencia"));
             al.setDate1(rs.getString("fecha"));
             inc_al.add(al);
         }
     }catch(Exception e){
         System.out.println(e);
     }
     return inc_al;
    }
        public List mostrarIncidence(String f1,String f2,String matr){
        Connection cnx=con.conectar();
        List<Incidence>inc_prof= new ArrayList();
     String sql="select id_incidencia,p.nombre,p.apellidoP,p.apellidoM,incidencia, fecha from incidencia inner join servicios_escolares p on " +
"    p.id_services=incidencia.id_se  where fecha between '"+f1+"' and '"+f2+"' and  p.matricula='"+matr+"'";
     
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
             Incidence al=new Incidence();
             al.setNombre(rs.getString("p.nombre"));
             al.setApellidoP(rs.getString("p.apellidoP"));
             al.setApellidoM(rs.getString("p.apellidoM"));
             al.setIncidence(rs.getString("incidencia"));
             al.setId(rs.getInt("id_incidencia"));
             al.setDate1(rs.getString("fecha"));
             inc_prof.add(al);
         }
     }catch(Exception e){
         System.out.println(e);
     }
     return inc_prof;
    }
           public String mostrarIncidenceId(int id_inc){
        Connection cnx=con.conectar();
        List<Incidence>inc_al= new ArrayList();
     String sql="select id_incidencia,incidencia from incidencia  where id_incidencia="+id_inc;
     String retorna="";
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
           
          
             retorna=rs.getString("incidencia");
            
            
         }
     }catch(Exception e){
         System.out.println(e);
     }
     return retorna;
    }
           public boolean updateProf(int id,String incidencia){
          Connection cnx=con.conectar();
          String sql="update incidencia set incidencia=? where id_incidencia=?";
          Incidence inc=new Incidence();
          try{
              pst=cnx.prepareStatement(sql);
             
              pst.setString(1,incidencia);
              pst.setInt(2, id);
              pst.executeUpdate();
              return true;
          }catch(Exception e){
              System.out.println(e);
              return false;
          }
      }
           public int idInc(String id){
               int idIncidencia=0;
               Connection cnx=con.conectar();
               try{
                   pst=cnx.prepareStatement("select distinct al.id from incidencia_al inner join alumno  al on al.id=incidencia_al.id_alumno where al.matricula='"+id+"' ;");
                   rs=pst.executeQuery();
                   while (rs.next()) {
                       idIncidencia=rs.getInt("al.id");
                   }
               }catch(Exception ex){
                   
               }
                return idIncidencia; 
           }
           public boolean insert(Incidence SE){
               
               Connection cnx=con.conectar();
             //  int id=idInc(SE.getMatricula());
              try{
                   pst=cnx.prepareStatement("insert into incidencia(incidencia,id_se,fecha)values(?,?,now())");
               pst.setString(1, SE.getIncidence());
               pst.setInt(2, 1);
              
               pst.executeUpdate();
               return true;
              }catch(Exception e){
                   Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, e);
                  return false;
              }
              
           }

  
}
