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
import modelo.Incidence;
import modelo.Incidence_al;
import modelo.Incidence_prof;
import modeloDAO.IncidenceDao;
import modeloDAO.Incidence_al_dao;
import modeloDAO.Incidence_prof_dao;
import static org.eclipse.jdt.internal.compiler.codegen.ConstantPool.Out;

/**
 *
 * @author julio
 */
@WebServlet(name = "ServIncidence", urlPatterns = {"/ServIncidence"})
public class ServIncidence extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
     
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try{
       if(request.getParameter("btn_check_fecha")!=null &&request.getParameter("opcion").equalsIgnoreCase("alumno")){
           String fecha1=request.getParameter("f1");
           String fecha2=request.getParameter("f2");
          String opcion_al=request.getParameter("opcion");
          String matr=request.getParameter("matricula");
          request.setAttribute("matr", matr);
           request.setAttribute("ff1", fecha1);
            request.setAttribute("ff2", fecha2);
             request.setAttribute("opc", opcion_al);
             request.getRequestDispatcher("incidencia.jsp").forward(request, response);
       }
         if(request.getParameter("btn_check_fecha")!=null &&request.getParameter("opcion").equalsIgnoreCase("profesor")){
           String fecha1=request.getParameter("f1");
           String fecha2=request.getParameter("f2");
          String opcion_prof=request.getParameter("opcion");
          String matr=request.getParameter("matricula");
           request.setAttribute("matr", matr);
           request.setAttribute("ff1", fecha1);
            request.setAttribute("ff2", fecha2);
             request.setAttribute("opc", opcion_prof);
              request.getRequestDispatcher("incidencia.jsp").forward(request, response);
       }
           if(request.getParameter("btn_check_fecha")!=null &&request.getParameter("opcion").equalsIgnoreCase("SE")){
           String fecha1=request.getParameter("f1");
           String fecha2=request.getParameter("f2");
          String opcion_SE=request.getParameter("opcion");
          String matr=request.getParameter("matricula");
           request.setAttribute("matr", matr);
           request.setAttribute("ff1", fecha1);
            request.setAttribute("ff2", fecha2);
             request.setAttribute("opc", opcion_SE);
              request.getRequestDispatcher("incidencia.jsp").forward(request, response);
       }
              if(request.getParameter("AlumnoId_incidence")!=null){
               String A_incidence=(String)request.getParameter("AlumnoId_incidence");
               Integer A=Integer.parseInt(A_incidence);
               Incidence_al_dao l= new Incidence_al_dao();
             String regresa= l.mostrarIncidenceId(A);
               request.setAttribute("A_inc",regresa);
               request.setAttribute("A_id",A_incidence);
                request.getRequestDispatcher("UpdateIncidencia.jsp").forward(request, response);
           
           }
           if(request.getParameter("ProfId_incidence")!=null){
               String P_incidence=(String)request.getParameter("ProfId_incidence");
               Incidence_prof_dao prof= new Incidence_prof_dao();
                int p=Integer.parseInt(P_incidence);
               String incProf=prof.mostrarIncidenceId(p);
                request.setAttribute("P_inc", incProf);
                request.setAttribute("P_id", P_incidence);
                request.getRequestDispatcher("UpdateIncidencia.jsp").forward(request, response);
           }
           if(request.getParameter("SeId_incidence")!=null){
                   String S_incidence=(String)request.getParameter("SeId_incidence");
                   int S=Integer.parseInt(S_incidence);
                    IncidenceDao inc= new IncidenceDao();
                   String incSe=inc.mostrarIncidenceId(S);
                    request.setAttribute("S_id", S_incidence);
                    request.setAttribute("S_inc", incSe);
                   request.getRequestDispatcher("UpdateIncidencia.jsp").forward(request, response);
           }
           if(request.getParameter("btn_edicion_se")!=null&&request.getParameter("table").equalsIgnoreCase("Alumno")){
               Incidence_al_dao incAl=new Incidence_al_dao();
               Incidence_prof_dao incProf= new Incidence_prof_dao();
               IncidenceDao incSE= new IncidenceDao();
              
               int id_incidencia=Integer.parseInt(request.getParameter("id_incidencia"));
                String incidencia=request.getParameter("incidencia");
           incAl.updateAl(id_incidencia, incidencia); 
                    }else   if(request.getParameter("btn_edicion_se")!=null&&request.getParameter("table").equalsIgnoreCase("Profesor")){
               Incidence_al_dao incAl=new Incidence_al_dao();
               Incidence_prof_dao incProf= new Incidence_prof_dao();
               IncidenceDao incSE= new IncidenceDao();
              
               int id_incidencia=Integer.parseInt(request.getParameter("id_incidencia"));
                String incidencia=request.getParameter("incidencia");
           incProf.updateProf(id_incidencia, incidencia); 
                    }else   if(request.getParameter("btn_edicion_se")!=null&&request.getParameter("table").equalsIgnoreCase("Servicio")){
             
               IncidenceDao incSE= new IncidenceDao();
              
               int id_incidencia=Integer.parseInt(request.getParameter("id_incidencia"));
                String incidencia=request.getParameter("incidencia");
           incSE.updateProf(id_incidencia, incidencia); 
                    }
           
       }catch(Exception e){
           System.out.println(e);
           request.getRequestDispatcher("incidencia.jsp").forward(request, response);
       }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
            String incide=(String)request.getParameter("area");
           String matricula=(String)request.getParameter("matricula");
         if(request.getParameter("btn_envia")!=null&&request.getParameter("opcion").equalsIgnoreCase("SE")){
           Incidence incidence= new Incidence(incide,matricula);
           IncidenceDao incDao= new IncidenceDao();
            incDao.insert(incidence);
           request.setAttribute("opc",request.getParameter("opcion"));
            request.setAttribute("opcion",matricula);
               request.setAttribute("inc",incide);
           
           request.getRequestDispatcher("agregar_incidencia.jsp").forward(request, response);
        }  if(request.getParameter("btn_envia")!=null&&request.getParameter("opcion").equalsIgnoreCase("Alumno")){
           Incidence_al inci= new Incidence_al();
           inci.setMatricula(request.getParameter("matricula"));
           inci.setIncidence(request.getParameter("area"));
           Incidence_al_dao incDao= new Incidence_al_dao();
            incDao.insert(inci);
      
           
           request.getRequestDispatcher("agregar_incidencia.jsp").forward(request, response);
        }
         if(request.getParameter("btn_envia")!=null&&request.getParameter("opcion").equalsIgnoreCase("Profesor")){
           Incidence_prof inc_prof= new Incidence_prof();
          
           inc_prof.setIncidence(request.getParameter("area"));
           inc_prof.setMatricula(request.getParameter("matricula"));
            Incidence_prof_dao daoProf= new Incidence_prof_dao();
            daoProf.insert(inc_prof);
          // request.setAttribute("opc",request.getParameter("opcion"));
             request.getRequestDispatcher("agregar_incidencia.jsp").forward(request, response);
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
