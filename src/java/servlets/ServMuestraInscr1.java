/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Asignatura;
import modelo.Profesor;
import modeloDAO.AsignaturaInscrDao;
import modeloDAO.ProfesorDao;

/**
 *
 * @author julio
 */
@WebServlet(name = "ServMuestraInscr1", urlPatterns = {"/ServMuestraInscr1"})
public class ServMuestraInscr1 extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            if(request.getParameter("btn_asignatura")!=null){
                String asignatura=request.getParameter("asignatura");
               // List<AsignaturaInscrDao>lis= inscr.listaAsignaturas(asignatura);
               request.setAttribute("asignaturaEnviada",asignatura) ;
                 request.getRequestDispatcher("inscripcion.jsp").forward(request, response); 
            }
              if(request.getParameter("btn_matricula")!=null){
                String matricula=request.getParameter("matricula");
               // List<AsignaturaInscrDao>lis= inscr.listaAsignaturas(asignatura);
               request.setAttribute("matriculaEnviada",matricula) ;
                 request.getRequestDispatcher("inscripcion.jsp").forward(request, response); 
            }
              if(request.getParameter("txtID")!=null){
                  int id=Integer.parseInt(request.getParameter("txtID"));
                  request.setAttribute("id_inscripcion",id);
                  
                  request.getRequestDispatcher("UpdateInscripcion.jsp").forward(request, response);
                  
              }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Asignatura asig= new Asignatura();
           AsignaturaInscrDao dao=new AsignaturaInscrDao();
        if(request.getParameter("btn_envia")!=null){
            asig.setAsignatura(request.getParameter("asignatura"));
                asig.setId_profesor(Integer.parseInt(request.getParameter("profesor")));
                        asig.setNivel_educativo(request.getParameter("nivel_academico"));
                        dao.insertAsignatura(asig);
        }
        if(request.getParameter("btn_elimina")!=null){
            int del=(Integer.parseInt(request.getParameter("asig")));
                dao.deleteAsig(del);
        }
      
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
