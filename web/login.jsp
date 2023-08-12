<%-- 
    Document   : login
    Created on : 11/08/2023, 11:00:59 PM
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>
   


    <div id="login">
<div class="llave"> 
   
</div>
<form action="ServLogin" method="GET">
            <h1>Inicio de sesion</h1>
              <label for="user">usuario</label>
            <input type="text" id="user" name="user" placeholder="ingrese su usuario"> <br><br>
            <label for="pass">contraseña</label>
            <input type="password" id="pass" name="pass" placeholder="ingrese su contraseña"> <br><br>
            <input type="submit" name="btn_login"><br><br>
        
             <a href="registrarse.jsp">nuevo usuario</a>
 
<p class="error"></p>
       
            </form>
 
   </div>
  
</body>
</html>
