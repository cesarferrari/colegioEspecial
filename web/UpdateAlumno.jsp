<%-- 
    Document   : UpdateAlumno
    Created on : 11/08/2023, 10:34:38 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Alumno"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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

       
          
             
                <form action="ServAlumno"  method="POST">
                <div class="form_box">
                    
                    <%
                    List<Alumno>alumno=(List<Alumno>)request.getAttribute("id_alumno");
                    Iterator<Alumno>itera=alumno.iterator();
                    Alumno al=null;
                    while (itera.hasNext()) {
                            al=itera.next();
                        
                    %>
                <label for="matricula">Matricula</label>
                <input type="text" name="matricula"  value="<%=al.getMatricula()%>" >
                </div>

                <div class="form_box">
                <label for="nombre">Nombre</label>
                <input type="text" name="nombre" value="<%=al.getNombre()%>" >
                </div>

                <div class="form_box">
             <label for="apellido">ApellidoP</label>
                <input type="text" name="apellidoP" value="<%=al.getApellido()%>">
             </div>

             <div class="form_box">
             <label for="apellidoM">ApellidoM</label>
                <input type="text" name="apellidoM" value="<%=al.getApellido_materno()%>">
             </div>
              <div class="form_box">
             <label for="email">Email</label>
                <input type="text" name="email" value="<%=al.getEmail()%>">
             </div>

              <div class="form_box">
              <label for="turno">turno</label>
                <select name="turno" id="turno">
                    <option value="<%=al.getTurno()%>"><%=al.getTurno()%></option>
                    <option value="Matutino">Matutino</option>
                    <option value="Vespertino">Vespertino</option>
                    <option value="Vespertino">Nocturno</option>
                    </select>
              </div>

             <div class="form_box">
             <label for="tipo_usuario">tipo de usuario</label>
                <select name="tipo_usuario" id="tipo_usuario">
                    <option value="<%=al.getTipo_usuario()%>"><%=al.getTipo_usuario()%></option>
                    <option value="Alumno">Alumno</option>
                    <option value="padre/tutor">padre o tutor</option>
                 
                    </select>
             </div>

                <div class="form_box">
                <label for="tipo_usuario">nivel educativo</label>
                <select name="nivel_educativo" id="nivel_educativo">
                    <option value="<%=al.getNivel_educativo()%>"><%=al.getNivel_educativo()%></option>
                    <option value="preescolar">preescolar</option>
                    <option value="primaria">primaria</option>
                    <option value="secundaria">secundaria</option>
                    <option value="preparatoria">preparatoria</option>
                    </select>
              
              
                </div>

               <div class="form_box">
               <label class="form_label" for="grupo">grupo</label> 
                <select name="grupo" id="grupo">
                    <option value="<%=al.getGrupo()%>"><%=al.getGrupo()%></option>
                    <option value="1-A">1-A</option>
                    <option value="1-B">1-B</option>
                    <option value="1-C">1-C</option>
                    <option value="2-A">2-A</option>
                    <option value="2-B">2-B</option>
                    <option value="2-C">2-C</option>
                    <option value="3-A">3-A</option>
                    <option value="3-B">3-B</option>
                    <option value="3-C">3-C</option>
                    <option value="4-A">4-A</option>
                    <option value="4-B">4-B</option>
                    <option value="4-C">4-C</option>
                    <option value="5-A">5-A</option>
                    <option value="5-B">5-B</option>
                    <option value="5-C">5-C</option>
                    <option value="6-A">6-A</option>
                    <option value="6-B">6-B</option>
                    <option value="6-C">6-C</option>
                 </select>
               </div>
                  
               
           <div class="form_boz">
           <button class="b2"  name="btn_edicion" id="grupo">EDITAR</button>
        
           </div>
                 </form>
                    <%}%>
                 <a href="alumnos.jsp">regresar</a>
                </div>
                       
       
            
      
           </div>
       
        </div>
    </div>
    
</html>
