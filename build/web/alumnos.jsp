<%-- 
    Document   : alumnos
    Created on : 11/08/2023, 10:55:31 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Alumno"%>
<%@page import="modeloDAO.AlumnoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alumno</title>
        <link rel="stylesheet" href="styles/alumno_estilo.css">
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
            <a href="colegiatura.jsp">
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
            <div class="grupo_form">
                <div class="selects">
                <form action="ServAlumno" class="form_grupo" method="GET">
                <label class="form_label" for="grupo">nivel educativo</label> 
                    <select name="nivel_1" id="nivel_1">
                    <option value="selecciona">selecciona un nivel</option>
                    <option value="preescolar">preescolar</option>
                    <option value="primaria">primaria</option>
                    <option value="secundaria">secundaria</option>
                    <option value="preparatoria">preparatoria</option>
                    </select>
                    <label class="form_label" for="grupo">grupo</label> 
                <select name="grupo" id="grupo">
                <option value="selecciona">selecciona un grupo</option>
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
                <button class="btn_sel"  name="btn_grupo" id="grupo">buscar</button>
                 </form>
                </div>
              
                <form class="nuevos" action="ServAlumno" class="form_grupo">
                    <label class="form_label" for="nivel">nuevos usuarios</label> 
                    <button class="btn_sel" name="btn_user" id="btn_user">buscar</button>
            </form>
                
               </div>
            
                
                <table class="tabla" id="data-table">
                    <tr>
                        <th>matricula</th>
                        <th colspan="2">nombre</th>
                        <th>email</th>
                         <th>turno</th>
                         <th>usuario</th>
                        <th>nivel </th>
                        <th>grupo</th>
                        <th>Editar</th>
                        </tr>
                    <%
                      
                       List<Alumno> al=null;
                      
                         Iterator<Alumno>itera=null;
                        String r=(String)request.getAttribute("user");
                    
                        String niv=(String)request.getAttribute("nivel");
                            String gru=(String)request.getAttribute("grup");
                        
                    AlumnoDao dao= new AlumnoDao();
                    if(niv!=null&&gru!=null){
                       al=dao.showAlumn( gru,niv);
                    }else{
                     al=dao.showAlumn();
                    }
                   
                      
                         itera=al.iterator(); 
                    
                    Alumno per=null;
                    while (itera.hasNext()) {
                            per=itera.next();
                        
                    %>
              
                        <tr>
                        <td data-titulo="matricula"><%=per.getMatricula()%></td>
                            <td data-titulo="nombre" colspan="2"><%=per.getNombre()+" "+per.getApellido()+" "+per.getApellido_materno()%></td>
                     
                            <td data-titulo="email"><%=per.getEmail()%></td>
                            <td data-titulo="turno"><%=per.getTurno()%></td>
                            <td data-titulo="tipo usuario"><%=per.getTipo_usuario()%></td>
                            <td data-titulo="nivel educativo"><%=per.getNivel_educativo()%></td>
                            <td data-titulo="grupo"><%=per.getGrupo()%></td>
                            <td><button class="boton"><a  href="ServAlumno?txtID=<%=per.getId()%>" >editar</a></button>
    
                        </tr>
                 
                        <%}
                        %>
                   
                </table>
       
            </div>
          
           </div>
    
        </div>
    </div>
    
</html>