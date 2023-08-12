
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
import modelo.Asignatura;
import modelo.Asignatura_inscripcion;


public class AsignaturaInscrDao {
   Conexion cn= new Conexion();
   Connection cnx=cn.conectar();
   PreparedStatement pst;
   ResultSet rs;
  
   
  /* public List mostrarAsignaturas(){
       List <Asignatura_inscripcion>inscrip=new ArrayList<>(); 
       List<String>cadena= new ArrayList();
       try {
           pst=cnx.prepareStatement("select asig.asignatura,prof.nombre,prof.apellidoP,prof.apellidoM from asignatura"
                   + "  asig inner join profesor prof on asig.id_profesor=prof.id_profesor");
           rs=pst.executeQuery();
           while (rs.next()) {
               asig.setNombre("prof.nombre");
               asig.setApellido("prof.apellidoP");
               asig.setApellido_materno("prof.apellidoM");
               asig.setAsignatura("asig.asignatura");
               cadena.add(asig.getAsignatura()+asig.getNombre()+asig.getApellido()+asig.getApellido_materno());
                       
           }
           inscrip.add(asig);
       } catch (SQLException ex) {
           Logger.getLogger(AsignaturaInscrDao.class.getName()).log(Level.SEVERE, null, ex);
       }
       return cadena;
   }*/
   
   public List listaAsignaturas(String asignatura){
          List <Asignatura_inscripcion>inscrip=new ArrayList<>(); 
       
       try {
           pst=cnx.prepareStatement("select id_insc,al.nombre,al.apellidoP,al.apellidoM,asig.asignatura,estatus from inscripcion_asignatura"+
                     " insc inner join alumno al on al.id=insc.id_alumno inner join asignatura asig on"+
                      " asig.id_asignatura=insc.id_asignatura where asig.asignatura='"+asignatura+"'");
           rs=pst.executeQuery();
           while (rs.next()) {
                Asignatura_inscripcion asig = new Asignatura_inscripcion();
               asig.setNombre(rs.getString("al.nombre"));
               asig.setApellido(rs.getString("al.apellidoP"));
               asig.setApellido_materno(rs.getString("al.apellidoM"));
               asig.setAsignatura(rs.getString("asig.asignatura"));
              asig.setEstatus(rs.getString("estatus"));
              asig.setId(rs.getInt("id_insc"));
                        inscrip.add(asig);  
           }
        
       } catch (SQLException ex) {
           Logger.getLogger(AsignaturaInscrDao.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
       return inscrip;
   }
      public List listaAsignaturaUP(int id_insc){
          List <Asignatura_inscripcion>inscrip=new ArrayList<>(); 
        try {
           pst=cnx.prepareStatement(" select id_insc,al.nombre,al.apellidoP,al.apellidoM,al.matricula,asig.asignatura,estatus from inscripcion_asignatura insc"+
"  inner join alumno al on al.id=insc.id_alumno inner join asignatura asig on asig.id_asignatura=insc.id_asignatura"+
"  where id_insc="+id_insc+"");
           rs=pst.executeQuery();
           while (rs.next()) {
                Asignatura_inscripcion asig = new Asignatura_inscripcion();
               asig.setNombre(rs.getString("al.nombre"));
               asig.setApellido(rs.getString("al.apellidoP"));
               asig.setApellido_materno(rs.getString("al.apellidoM"));
             asig.setMatricula(rs.getString("al.matricula"));
             asig.setAsignatura(rs.getString("asig.asignatura"));
           asig.setEstatus(rs.getString("estatus"));
            asig.setId(rs.getInt("id_insc"));
             
                        inscrip.add(asig);  
           }
        
       } catch (SQLException ex) {
           Logger.getLogger(AsignaturaInscrDao.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
       return inscrip;
   }
    public List listaMatricula(String matricula){
          List <Asignatura_inscripcion>inscrip=new ArrayList<>(); 
       
       try {
           pst=cnx.prepareStatement(" select id_insc,al.nombre,al.apellidoP,al.apellidoM,asig.asignatura,estatus from inscripcion_asignatura insc"+
"  inner join alumno al on al.id=insc.id_alumno inner join asignatura asig on asig.id_asignatura=insc.id_asignatura"+
"  where al.matricula='"+matricula+"'");
           rs=pst.executeQuery();
           while (rs.next()) {
                Asignatura_inscripcion asig = new Asignatura_inscripcion();
               asig.setNombre(rs.getString("al.nombre"));
               asig.setApellido(rs.getString("al.apellidoP"));
               asig.setApellido_materno(rs.getString("al.apellidoM"));
             //asig.setMatricula(rs.getString("al.matricula"));
             asig.setAsignatura(rs.getString("asig.asignatura"));
           asig.setEstatus(rs.getString("estatus"));
            asig.setId(rs.getInt("id_insc"));
             
                        inscrip.add(asig);  
           }
        
       } catch (SQLException ex) {
           Logger.getLogger(AsignaturaInscrDao.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
            try {
                cnx.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Incidence_al_dao.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
       return inscrip;
   }
    
    public boolean insertAsignatura(Asignatura asig){
        Connection cnx=cn.conectar();
        
        try{
            pst=cnx.prepareStatement("insert into asignatura(id_profesor,asignatura,nivel_educativo)values(?,?,?)");
            pst.setInt(1, asig.getId_profesor());
            pst.setString(2, asig.getAsignatura());
            pst.setString(3, asig.getNivel_educativo());
           int rev= pst.executeUpdate();
           if(rev>0){
            return true;                             
            }else{
               return false;
           }
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    public void deleteAsig(int asig){
        Connection cnx=cn.conectar();
        try{
            pst=cnx.prepareStatement("delete from asignatura where id_asignatura="+asig);
            pst.execute();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
