
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class Conexion {
    
    private  final String pass="";
    private  final String root="root";
    private  final String dB="college";
    private  final String host="jdbc:mysql://localhost/"+dB;
    private  Connection con=null;
    
    public  Connection conectar(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(host,root,pass);
            
        }catch(Exception e)
        {
            System.out.println("error al conectar con la database"+e);
        }
        
        
        
        return con;
    }
    
    
    
}
