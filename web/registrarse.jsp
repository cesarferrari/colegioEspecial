<%-- 
    Document   : registrase
    Created on : 11/08/2023, 11:02:30 PM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> -->
        <script src="https://kit.fontawesome.com/6a4751c08d.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="styles/esty.css">


</head>
<body>
    <header>
    <nav>
    <input type="checkbox" id="check">
    <label for="check" class="checkbtn">
    <i class="fas fa-bars"></i>
    
    </label>
    <a href="" class="enlace">
        <img src="imagen/demo.jpg" alt="" class="logo">
    </a>
    <ul>
    <li><a href="index.jsp">inicio</a></li>
    <li><a href="registrarse.jsp">registrarse</a></li>
    <li><a href="login.jsp">login</a></li>
    </ul>
        </nav>
    </header>
    <h2>Registrarse</h2>
   

    <div class="contour">
        <form  action="servRegistrarse" method="POST">
           
           
          
          
            <div class="inputa">
                
            <label class="form_label" for="matricula">Matricula</label>
            <input type="text" id="matricula" name="matricula" placeholder="Matricula" > 
            </div>
            
         <div class="inputa">
            <label class="form_label" for="user">Nombre</label>  
            <input type="text" id="user" name="user" placeholder="Nombre"> 
         </div>
          
          <div class="inputa">
            <label class="form_label" for="apellido">Apellido</label>
            <input type="text" id="apellido" name="apellido" placeholder="Apellido paterno"> 
          </div>
                
           <div class="inputa">
            <label class="form_label" for="apellido1">Apellido</label> 
            <input type="text" id="apellido1" name="apellido1" placeholder="Apellido materno">
           </div>
           
          <div class="inputa">
            <label class="form_label" for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Email">
          </div>

            <div class="inputa">
                <label class="form_label" for="password">Password</label>
                <input type="password" id="pass" name="pass" placeholder="Password">
            </div>

           <div class="inputa">
            <label class="form_label" for="password">Password</label>
            <input type="password" id="pass1" name="pass1" placeholder="Confirmar password">
           </div>

         <button  class="btn_form" type="submit" name="btn_envia">guardar</button>
            </form>
         </div>
   

     
      <footer class="pie-pagina">
    <div class="grupo-1">
    <div class="box">
    <figure>
        <a href="#">
            <img src="imagen/edu.jpg" alt="logo">
        </a>
    </figure>
    </div>
    <div class="box">
        <h2>SOBRE NOSOTROS</h2>
        <h3>somos una institucion que reconocemos el valor unico de cada niño
por lo que nuestar tarea principal es conocer a cada uno de nuestros
estudiantes y proporcionarles la estrategia de aprendizaje mas
adecuada que ellos necesitan</h3>
    
    </div>
    <div class="box">
        <h2>SIGUENOS</h2>
        <div class="red-social">
            <a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-instagram"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-youtube"></a>
        </div>
    </div>
    </div>
    <div class="grupo-2">
        <small>&copy; 2023 <b>Educacion Especial</b> - Todos los Derechos Reservados-</small>
    </div>
        </footer>
    
</body>

</html>