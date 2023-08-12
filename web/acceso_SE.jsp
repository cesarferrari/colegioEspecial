<%-- 
    Document   : acceso_SE
    Created on : 11/08/2023, 10:43:51 PM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/style_SE.css">
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
           <%
           HttpSession sesion=request.getSession();
           
        String rel=(String)sesion.getAttribute("session_logSe");
         if(sesion.getAttribute("session_logSe")==null){
             response.sendRedirect("login.jsp");
             }
             %>
                   
             
               
               
                <li><a href="ServDestroy">inicio</a></li>
               
                <li><a href="noticias.php">noticias</a></li>
               
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
             
                
              <div class="form_group">
            <form  action="<?php htmlspecialchars($_SERVER['PHP_SELF'])?>" method="GET">
             <select name="combo" id="combo">
           
              
             </select>
         <button type="submit" name="btn_combo">buscar</button>
    </form>
    </div>
      <div class="boxt">

        <h2 class="encabezado"></h2>
 <p class="img-1"></p>
  <img class="imagen1" src="<?php  echo $user['url']?>" alt="no disponible ">

        
 <p class="img-1"></p>
  <img class="imagen1" src="<?php  echo $user['url']?>" alt="no disponible ">
  <h2 class="encabezado"><?php echo $user['encabezado']?></h2>

  </div>
    </div>
                </body>
</html>

