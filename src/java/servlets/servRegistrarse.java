/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import modelo.Alumno;
import modeloDAO.AlumnoDao;
import static org.eclipse.jdt.internal.compiler.codegen.ConstantPool.Out;

/**
 *
 * @author julio
 */
@WebServlet(name = "servRegistrarse", urlPatterns = {"/servRegistrarse"})
public class servRegistrarse extends HttpServlet {

  String matricula="",name="",lastname="",lastname1="",email="",password="";
  Alumno al= new Alumno();
  AlumnoDao dao= new AlumnoDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
      
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
     
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
         if(request.getParameter("btn_envia")!=null){
             al.setMatricula(request.getParameter("matricula"));
         al.setNombre(request.getParameter("user"));
          al.setApellido(request.getParameter("apellido"));
            al.setApellido_materno(request.getParameter("apellido1"));
              al.setEmail(request.getParameter("email"));
                String password=request.getParameter("pass");
                  String passwordX=request.getParameter("pass1");
                  if(password.equalsIgnoreCase(passwordX)){
                      al.setPassword(request.getParameter("pass"));
                  }else{
                    
                  }
                if(dao.inserAlumno(al)){
                    request.getRequestDispatcher("acceso.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                }
                  /* if(name.equalsIgnoreCase("leonidas")&&email.equalsIgnoreCase("gilipollas@gmail.com")){
                      HttpSession sesion=request.getSession(true);
                    sesion.setAttribute("nombreSesion",name);
                      request.getRequestDispatcher("acceso_profesor.jsp").forward(request, response);
                }*/
                 
       
                  }
         
          
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
