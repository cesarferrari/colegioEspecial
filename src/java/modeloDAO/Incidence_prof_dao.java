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
import modelo.Incidence;
import modelo.Incidence_al;
import modelo.Incidence_prof;

/**
 *
 * @author julio
 */
public class Incidence_prof_dao {
    
    Incidence_prof incidence= new Incidence_prof();
    Conexion con = new Conexion();
    PreparedStatement pst;
    ResultSet rs;
    
    public List mostrarIncidence(String f1,String f2){
        Connection cnx=con.conectar();
        List<Incidence_prof>inc_al= new ArrayList();
     String sql="select id_incidencia,p.nombre,p.apellidoP,p.apellidoM,incidencia,fecha from incidencia_prof  inner join profesor p on "
             + "p.id_profesor=incidencia_prof.id_profesor  where fecha between+'"+f1+"' and '"+f2+"'";
     
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
             Incidence_prof al=new Incidence_prof();
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
        List<Incidence_prof>inc_prof= new ArrayList();
     String sql="select id_incidencia,p.nombre,p.apellidoP,p.apellidoM,incidencia, fecha from incidencia_prof inner join profesor p on " +
"    p.id_profesor=incidencia_prof.id_profesor  where fecha between '"+f1+"' and '"+f2+"' and  p.matricula='"+matr+"'";
     
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
             Incidence_prof al=new Incidence_prof();
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
        List<Incidence_al>inc_al= new ArrayList();
     
      String sql="select  id_incidencia,incidencia from incidencia_prof where id_incidencia="+id_inc;
      String regresa="";
     try{
         pst=cnx.prepareStatement(sql);
         rs=pst.executeQuery();
         while (rs.next()) {
         
          
          regresa=rs.getString("incidencia");
          
         }
     }catch(Exception e){
         System.out.println(e);
     }
     return regresa;
    }
      public boolean updateProf(int id,String incidencia){
          Connection cnx=con.conectar();
          String sql="update incidencia_prof set incidencia=? where id_incidencia=?";
          Incidence_prof prof=new Incidence_prof();
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
    public  int idInc(String id){
               int idIncidencia=0;
             
              Connection cnx=con.conectar();
           String sql="select distinct p.id_profesor from incidencia_prof inner join profesor p on p.id_profesor=incidencia_prof.id_profesor where p.matricula='"+id+"'";
               try{
                  PreparedStatement pst=cnx.prepareStatement(sql);
                  ResultSet rs=pst.executeQuery();
                   while (rs.next()) {
                       idIncidencia=rs.getInt("p.id_profesor");
                   }
               }catch(Exception ex){
                   System.out.println(ex);
               }
                return idIncidencia; 
           }
    public boolean insert(Incidence_prof prof) {
       Connection cnx=con.conectar();
       try{
           pst=cnx.prepareStatement("insert into incidencia_prof(incidencia,id_profesor,fecha)values(?,?,now())");
           pst.setString(1,prof.getIncidence());
           pst.setInt(2,idInc(prof.getMatricula()));
           pst.executeUpdate();
           return true;
       }catch(Exception e){
           
           return false;
       }
    }
}
