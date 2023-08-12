<%-- 
    Document   : profesor
    Created on : 11/08/2023, 11:01:40 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.ProfesorDao"%>
<%@page import="modelo.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/style_asignatura.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <script src="https://kit.fontawesome.com/6a4751c08d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
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
            <%
           HttpSession sesion=request.getSession();
           
        String rel=(String)sesion.getAttribute("session_logSe");
         if(sesion.getAttribute("session_logSe")==null){
             response.sendRedirect("login.jsp");
             }
             %>
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
            <i class="fa-duotone fa-building-columns"></i>
                <h4>  incidencias </h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="colegiatura.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> Colegiaturas</h4>
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
            <i class="fa-thin fa-screen-users"></i>
            <h4>profesores</h4>
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
           <div class="filt">
                <div class="encabezado">
                <h2>consultas de alumnos elige una opcion   </h2>
                <h3> <a href="agregar_profesor.jsp">Agregar Profesor</a></h3>
                </div>
            <form action="ServProfesor" class="form_grupo" method="GET">
                 <label class="form_label" for="grupo">Todos los Profesores</label> 
                 <button class="boton"  name="btn_general" id="grupo">buscar</button>
                 </form>

             <form action="ServProfesor" class="form_grupo" method="GET">
                 <label class="form_label" for="nivel">matricula del Profesor</label> 
                  <input type="text" name="matricula">
                        <button class="boton"  name="btn_matricula" id="btn_matricula">buscar</button>
            </form>
            <table>
            <tr>
                <th colspan="2">Nombre</th>
                <th>Email</th>
                <th>Matricula</th>
                <th>Asignatura</th>
                <th>nivel</th>
                <th>Editar</th>
            </tr>
            <%
            String boton=(String)request.getAttribute("boton");
            String matr=(String)request.getAttribute("matricula");
            ProfesorDao dao= new ProfesorDao();
           
                  List<Profesor>pro=dao.mostrarProfesor();
            
                  List<Profesor>proX=dao.mostrarProfesor(matr);
            
          
           
             Iterator <Profesor>itera=pro.iterator();
             Iterator <Profesor>iteraX=proX.iterator();
             
             Profesor pr=null;
             Profesor pd=null;
                 while (iteraX.hasNext()){
                 pd=iteraX.next();
                     

            %>
           
         
                           <tr>
                            <td colspan="2"><%=pd.getNombre()+" "+pd.getApellido()%></td>
                            <td><%=pd.getEmail()%></td>
                           <td><%=pd.getMatricula()%></td>
                            <td><%=pd.getAsignatura()%></td>
                            <td><%=pd.getNivel_educativo()%></td>
                            <td><button class="boton"><a  href="ServProfesor?prof=<%=pd.getId_asignatura()%>">Editar</a></button></td>   
                        </tr>
                   
                         <%}    while (itera.hasNext()&&boton!=null){
                 pr=itera.next();
                     

            %>
                         <tr>
                            <td colspan="2"><%=pr.getNombre()+" "+pr.getApellido()%></td>
                            <td><%=pr.getEmail()%></td>
                           <td><%=pr.getMatricula()%></td>
                            <td><%=pr.getAsignatura()%></td>
                            <td><%=pr.getNivel_educativo()%></td>
                            <td><button class="boton"><a  href="ServProfesor?prof=<%=pr.getId_asignatura()%>" >Editar</a></button></td>   
                        </tr>
                   
                         <%}%>
                 


        </table>  
            </div>
             </div>
        
        </div>
       
      
    
    
          
        </body>
</html>
