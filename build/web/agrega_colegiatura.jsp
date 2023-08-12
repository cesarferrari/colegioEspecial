<%-- 
    Document   : agrega_colegiatura
    Created on : 11/08/2023, 11:31:29 PM
    Author     : julio
--%>

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/ins_colegiatura.css">
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
                <h4>  incidencias profesores</h4>
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
            <a href="noticias.jsp">
                <i class="fa-sharp fa-regular fa-calendar-days"></i>
                <h4> noticias</h4>
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

              
                <div class="formulario">
                    <a class="encabezado" href="colegiatura.php">
                        <i class="fa-sharp fa-regular fa-calendar-days"></i>
                        <h3>Colegiatura</h3>
                    </a> 
                   
                    <form  action="" method="POST">
                        <div class="inputa">
                             <label class="form_label" for="motivo">Motivo</label>
                        <input type="text" id="matricula" name="motivo" placeholder="Ingrese el motivo" > 
                        </div>
                        <div class="inputa">
                        <label class="form_label" for="user">Monto</label>  
                        <input type="number" id="cantidad" name="monto" placeholder="Ingrese la cantidad"> 
                     </div>
                   <div class="inputa">
                        <label class="form_label" for="user">Matricula</label>  
                        <input type="text" id="user" name="user" placeholder="matricula de alumno"> 
                     </div>
                  <button  class="btn_form" type="submit" name="btn_envia">guardar</button>
                        </form>
                     </div>
              
            </div>
         
             </div>
        
        </div>
       
        
    
    
          
        </body>
</html>
