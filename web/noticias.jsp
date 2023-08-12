<%-- 
    Document   : noticias
    Created on : 11/08/2023, 11:37:47 PM
    Author     : julio
--%>

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
         <%
         HttpSession sesion=request.getSession();
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
                <h4> Colegiatura</h4>
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
  <form action="" method="POST">
          
     
            <div class="inputa">
            <h2>   <a href="updateNoticia.jsp">Noticias</a></h2>
            </div>
          
            <div class="form_grupo">
           <label class="form_label" for="url">URL</label>
                <input type="text" id="nombre" name="url" placeholder="ingrese URL de la imagen" > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="tipo">titulo</label>
                <input type="text" id="nombre" name="titulo" placeholder="ingrese titulo de la noticia"   > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="tipo">titulo</label>
                <input type="text" id="encabezado" name="encabezado" placeholder="encabezado de la nota"  > 
                </div>
             <div class="form_grupo">
           <label class="form_label" for="noticia">noticia</label>
            <textarea  autofocus maxleinght=200 name="noticia" id="" cols="30" rows="5"  ></textarea>
                </div>
             <div class="inputa">
           
             <button class="button" type="submit" name="btn_envia" value="Enviar">Enviar</button>
 

                    </div>
                </form>


            </div>

            

             </div>
             </div>
        </div>
          </body>
</html>
