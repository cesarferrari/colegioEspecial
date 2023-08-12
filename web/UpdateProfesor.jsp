<%-- 
    Document   : UpdateProfesor
    Created on : 11/08/2023, 10:40:29 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Profesor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <%
           HttpSession sesion=request.getSession();
           
        String rel=(String)sesion.getAttribute("session_logSe");
         if(sesion.getAttribute("session_logSe")==null){
             response.sendRedirect("login.jsp");
             }
             %>
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

       
          
             
                <form action="ServProfesor"  method="POST">
                <div class="form_box">
                <label for="matricula">Matricula</label>
                <%
                List<Profesor>prof=(List<Profesor>)request.getAttribute("profesor");
                Iterator<Profesor>itera=prof.iterator();
                Profesor p=null;
                while (itera.hasNext()) {
                        p=itera.next();
                    
                %>
                <input type="text" name="matricula"  value="<%=p.getMatricula()%>" >
                </div>

                <div class="form_box">
                <label for="nombre">Nombre</label>
                <input type="text" name="nombre" value="<%=p.getNombre()%>" >
                </div>

                <div class="form_box">
             <label for="apellido">ApellidoP</label>
                <input type="text" name="apellidoP" value="<%=p.getApellido()%>">
             </div>
             <div class="form_box">
             <label for="apellidoM">ApellidoM</label>
             <input type="text" name="apellidoM" value="<%=p.getApellido_materno()%>">
             </div>
             <div class="form_box">
             <label for="email">Email</label>
                <input type="text" name="email" value="<%=p.getEmail()%>">
             </div>
            
           <div class="form_boz">
           <button class="b2"  name="btn_edicion" id="grupo">EDITAR</button>
           </div>
                 </form>
                <%}%>
                 <a href="profesor.jsp">regresar</a>
                </div>
         
                     
       
            
      
           </div>
       
        </div>
    </div>
    
</html>
