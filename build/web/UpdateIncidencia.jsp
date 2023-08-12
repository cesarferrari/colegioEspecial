<%-- 
    Document   : UpdateIncidencia
    Created on : 11/08/2023, 10:38:02 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Incidence_prof"%>
<%@page import="modelo.Incidence"%>
<%@page import="modelo.Incidence_al"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.IncidenceDao"%>
<%@page import="modeloDAO.Incidence_al_dao"%>
<%@page import="modeloDAO.Incidence_prof_dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alumno</title>
        <link rel="stylesheet" href="styles/estile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <script src="https://kit.fontawesome.com/6a4751c08d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <script src="alumno.js"></script>
        <nav>
                <input type="checkbox" id="check">
                <label for="check" class="checkbtn">
                <i class="fas fa-bars"></i>
                
                </label>
                <a href="" class="enlace">
                    <img src="imagen/demo.png" alt="" class="logo">
                </a>
                <ul>
            
                <li><a href="ServDestroy">inicio</a></li>
                <li><a href="noticias.jsp">noticias</a></li>
               
                </ul>
                    </nav>
            <div class="container">
    <div class="lateral">
  
    <div class="option">
        <div class="logotipo">
            <a href="acceso_SE.jsp">
            <i class="fa-solid fa-house"></i>
                <h4>pricipal</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="incidencia.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4>  incidencias </h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="alumnos.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> alumnos</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="profesor.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4>profesores</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="colegiaturas.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> Colegiaturas</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="inscripcion.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> inscripciones</h4>
            </a>
        </div>
      
    </div>
            </div>
    
            <div class="body">
            <div class="left">
            
            <div class="form_grupo">
  <form action="ServIncidence"  method="GET">
      
 <% 
     String table="",incidencia="",id="";
                  if(request.getAttribute("S_inc")!=null){
                      id=(String)request.getAttribute("S_id");
                   incidencia=(String)request.getAttribute("S_inc");
                   table="Servicio";
                  }else if(request.getAttribute("A_id")!=null){
                      table="Alumno";
                  id=(String)request.getAttribute("A_id");
                   incidencia=(String)request.getAttribute("A_inc");
                  }else if(request.getAttribute("P_inc")!=null){
                     id=(String)request.getAttribute("P_id");
                    incidencia=(String)request.getAttribute("P_inc");
                    table="Profesor";
                  }
                   %>
                        
         
                <div class="form_box">
                <label for="matricula">Matricula</label>
                <input type="text" name="id_incidencia"  value="<%=id%>" >
                </div>
                <div class="form_box">
                <label class="form_label" for="incidence">Incidencia</label>
            <textarea  autofocus maxlenght=200 name="incidencia" id="" cols="30" rows="5"><%=incidencia%></textarea>
                </div>
          <div class="form_boz">
              <input type="hidden" name="table" value="<%=table%>">
           <button class="b2"  name="btn_edicion_se" id="grupo">EDITAR</button>
           </div>
                   
                 </form>
         
                
                 <a href="incidencia.jsp">regresar</a>
                </div>
                </div>
    </div>
    </div>
    
</html>
