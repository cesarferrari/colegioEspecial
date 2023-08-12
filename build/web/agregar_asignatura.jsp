<%-- 
    Document   : agregar_asignatura
    Created on : 11/08/2023, 11:17:07 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Profesor"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.ProfesorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/ins_profesor.css">
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
          
            <div class="lateral">
    <div class="option">
   
        <div class="logotipo">
            <a href="acceso_SE.php">
            <i class="fa-solid fa-house"></i>
                <h4>pricipal</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="incidencia.php">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4>  incidencias </h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="alumnos.php">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> alumnos</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="profesor.php">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4>profesores</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="colegiatura.php">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4>Colegiatura</h4>
            </a>
        </div>
        <div class="logotipo">
            <a href="inscripcion.php">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> inscripciones</h4>
            </a>
        </div>
      
        
    </div>
            </div>
    
            <div class="body">
        
            <div class="formulario">
            
                <div class="elimina">
              
              </div>
            </div>

                  
                
             </div>
             </div>
        
        </div>
       
        
    
    
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        </body>
</html>
