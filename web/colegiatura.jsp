<%-- 
    Document   : colegiatura
    Created on : 11/08/2023, 10:56:25 PM
    Author     : julio
--%>

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
            <i class="fa-regular fa-sack-dollar"></i>
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
            <a href="profesor.php">
            <i class="fa-thin fa-screen-users"></i>
            <h4>profesores</h4>
            </a>
        </div>
     
        <div class="logotipo">
            <a href="inscripcion.jsp">
           
            <i class="fa-regular fa-circle-plus"></i>
                <h4> inscripciones</h4>
            </a>
        </div>
      
    </div>
            </div>
     <div class="body">
           <div class="filt">
                <div class="encabezado">
                <h2>consultas de Colegiaturas </h2>
                 <h2><a href="agrega_colegiatura.jsp">  <i class="fa-regular fa-sack-dollar"></i></i></a></h2>
                </div>
            <form action="<% %>" class="form_grupo" method="GET">
                 <label class="form_label" for="grupo">Fecha Inicio</label> 
                 <input type="date" name="fechaI">
                 <label class="form_label" for="grupo">Fecha Fin</label> 
                 <input type="date" name="fechaF"> <br>
                
                <label class="form_label" for="nivel">matricula  alumno</label> 
                  <input type="text" name="matricula">
                        <button class="boton"  name="btn_matricula" id="btn_matricula">buscar</button>
            </form>
               <form action="<% %>" class="form_grupo" method="GET">
                <label class="form_label" for="grupo">Fecha Inicio</label> 
                <input type="date" name="fechaIA">
                <label class="form_label" for="grupo">Fecha Fin</label> 
                <input type="date" name="fechaFA"> <br>
               <button class="boton"  name="btn_fecha" id="btn_fecha">buscar</button>
           </form>
            <table>
            <tr>
                <th colspan="2">Nombre</th>
                <th>Monto</th>
                <th>Motivo</th>
                <th>Fecha</th>
                <th>Editar</th>
            </tr>
            <div class="tab">
                        
                              <tr>
                                <td colspan="2"></td>
                                 <td></td>
                                  <td></td>
                                  <td></td>
                                  <td><button class="boton"><a  href="" >Editar</a></button>
                              </tr>
                        
                           <tr>
                             <td colspan="2"></td>
                              <td></td>
                               <td></td>
                               <td></td>
                               <td><button class="boton"><a  href="UpdateColegiatura.jsp?txtID=<%%>" >Editar</a></button>
                           </tr>
                      
                        
                       </table>
                       
                             
            </div>
             </div>
        
        </div>
       
      
    
    
          
        </body>
</html>

