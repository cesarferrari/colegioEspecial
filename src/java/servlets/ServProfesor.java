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
import modelo.Profesor;
import modeloDAO.ProfesorDao;

/**
 *
 * @author julio
 */
@WebServlet(name = "ServProfesor", urlPatterns = {"/ServProfesor"})
public class ServProfesor extends HttpServlet {

   Profesor prof= new Profesor();
   ProfesorDao pr= new ProfesorDao();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServProfesor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServProfesor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if(request.getParameter("btn_general")!=null){
           String btn="acceso";
           request.setAttribute("boton", btn);
           request.getRequestDispatcher("profesor.jsp").forward(request, response);
       }
         if(request.getParameter("btn_matricula")!=null){
           String matricula=(String)request.getParameter("matricula");
           request.setAttribute("matricula",matricula);
           request.getRequestDispatcher("profesor.jsp").forward(request, response);
       }
         if(request.getParameter("prof")!=null){
             Profesor pr= new Profesor();
             ProfesorDao dao= new ProfesorDao();
        List<Profesor>pro=dao.mostrarProfesorAsig(request.getParameter("prof"));
           request.setAttribute("profesor",pro);
             request.getRequestDispatcher("UpdateProfesor.jsp").forward(request, response);
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if(request.getParameter("btn_envia")!=null){
         prof.setNombre(request.getParameter("nombre"));
          prof.setApellido(request.getParameter("apellidoP"));
           prof.setApellido_materno(request.getParameter("apellidoM"));
            prof.setEmail(request.getParameter("email"));
             prof.setMatricula(request.getParameter("matricula"));
              
           request.setAttribute("prueba",pr.insertProfesor(prof));
           request.getRequestDispatcher("profesor.jsp").forward(request, response);
          
       }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
