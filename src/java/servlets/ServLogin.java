
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumno;
import modeloDAO.AlumnoDao;

/**
 *
 * @author julio
 */
@WebServlet(name = "ServLogin", urlPatterns = {"/ServLogin"})
public class ServLogin extends HttpServlet {
Alumno al= new Alumno();
  AlumnoDao dao=new AlumnoDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           if(request.getParameter("btn_login")!=null){
          String user=request.getParameter("user");
          String pass=request.getParameter("pass");
          al.setMatricula(user);
          al.setPassword(pass);
          int alumno=dao.mostrarAlumno(al);
             int prof=dao.mostrarProfesor(al);
                int SE=dao.mostrarSE(al);
          if(alumno>0){
              request.getSession().setAttribute("session_logAl", user);
              request.getRequestDispatcher("acceso.jsp").forward(request, response);
          }else if(prof>0){
               request.getSession().setAttribute("session_logProf", user);
              request.getRequestDispatcher("acceso_profesor.jsp").forward(request, response);
          }else if(SE>0){
               request.getSession().setAttribute("session_logSe", user);
              request.getRequestDispatcher("acceso_SE.jsp").forward(request, response);
              }else{
                 request.getRequestDispatcher("index.jsp").forward(request, response);
          }
          
      }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
