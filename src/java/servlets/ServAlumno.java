/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ServAlumno", urlPatterns = {"/ServAlumno"})
public class ServAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("btn_grupo")!=null){
            String level=request.getParameter("nivel_1");
            String group=request.getParameter("grupo");
            request.setAttribute("nivel", level);
            request.setAttribute("grup", group);
            request.getRequestDispatcher("alumnos.jsp").forward(request, response);
        }
         if(request.getParameter("btn_user")!=null){
             String user=request.getParameter("btn_user");
             request.setAttribute("user",user);
             request.getRequestDispatcher("alumnos.jsp").forward(request, response);
         }
         if(request.getParameter("txtID")!=null){
             AlumnoDao dao= new AlumnoDao(); 
             List<AlumnoDao>alDao=dao.showAlumn(request.getParameter("txtID"));
             request.setAttribute("id_alumno", alDao);
             request.getRequestDispatcher("UpdateAlumno.jsp").forward(request, response);
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("btn_edicion")!=null){
            Alumno al= new Alumno();
            al.setMatricula(request.getParameter("matricula"));
            al.setNombre(request.getParameter("nombre"));
            al.setApellido(request.getParameter("apellidoP"));
            al.setApellido_materno(request.getParameter("apellidoM"));
            al .setEmail(request.getParameter("email"));
            al.setGrupo(request.getParameter("grupo"));
            al.setTurno(request.getParameter("turno"));
            al.setNivel_educativo(request.getParameter("nivel_educativo"));
            al.setTipo_usuario(request.getParameter("tipo_usuario"));
            AlumnoDao dao= new AlumnoDao();
            dao.updateAlumno(al);
            
            request.getRequestDispatcher("alumnos.jsp").forward(request, response);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
