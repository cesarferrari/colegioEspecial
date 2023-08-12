<%-- 
    Document   : agregar_profesor
    Created on : 11/08/2023, 11:19:38 PM
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
               <li><a href="noticias.php">noticias</a></li>
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
            <a href="incidencias.jsp">
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
        
            <div class="formulario">
            <form action="ServProfesor" method="POST">
            <div class="inputa">
            <h2>   <a href="profesor.jsp"> Profesor</a></h2>
            </div>
           
            <div class="form_grupo">
           <label class="form_label" for="nombre">Nombre</label>
                <input type="text" id="nombre" name="nombre" placeholder="ingrese nombre" > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="apellidoP">Apellido Paterno</label>
                <input type="text" id="apellidoP" name="apellidoP" placeholder="ingrese apellido" > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="apellidoM">Apellido Materno</label>
                <input type="text" id="apellidoM" name="apellidoM" placeholder="ingrese apellido" > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="ingrese email" > 
                </div>
                <div class="form_grupo">
           <label class="form_label" for="matricula">Matricula</label>
                <input type="text" id="matricula" name="matricula" placeholder="ingrese matricula" > 
                </div>
             
             
                    <div class="inputa">
                    <button  class="button2" type="submit" name="btn_envia">guardar</button>
                    </div>
                </form>
                
                 <form action="ServMuestraInscr1" method="POST">
            <div class="inputa">
            <h2>   <a href="inscripcion.jsp">Consultar asignatura</a></h2>
            </div>
            <div class="form_grupo">
           
                <label class="form_label" for="matricula">Asignatura</label>
                <input type="text" id="asigntura" name="asignatura" placeholder="ingrese asignatura" > 
                </div>
                
             <div class="form_grupo">
             <label class="form_label" for="grupo">Profesor</label> 
         
                     <select name="profesor" id="profesor">
                     <option value="Elige una opcion">elige una opcion</option>
                 
                    <%
                    ProfesorDao dao=new ProfesorDao();
                
                    List<Profesor>prof=dao.mostrarProfesorU();
                    Iterator<Profesor>itera=prof.iterator();
                    Profesor p= null;
                    while (itera.hasNext()) {
                            p=itera.next();
                 %>
                 <option value=<%=p.getId()%>><%=p.getNombre()+" "+p.getApellido()+" "+p.getApellido_materno()%></option>
  
                             <%}%>
      </select>
      <label class="form_label" for="nivel">Nivel Academico</label> 
      <select name="nivel_academico" id="nivel_academico">
<option value="Elige una opcion">Elige una Opcion</option>
<option value="Preescolar">Preescolar</option>
<option value="Primaria">Primaria</option>
<option value="Secundaria">Secundaria</option>
<option value="Preparatoria">Preparatoria</option>

      </select>
             </div>
                    <div class="inputa">
                    <button  class="button2" type="submit" name="btn_envia">guardar</button>
                    </div>
                    <h2 class="form_elimina" for="grupo">Eliminar asignatura</h2> 
                </form>
        <form action="ServMuestraInscr1" class="form_grupo" method="POST">
                 
                
                  <select name="asig" id="asig">
                  <option value="elige unan opcion">elige una opcion</option>
          
                 
                  <%
                  ProfesorDao d=new ProfesorDao();
                  List<Profesor>pr=d.mostrarProfesor();
                  Iterator<Profesor>it=pr.iterator();
                  Profesor pro=null;
                  while (it.hasNext()) {
                          pro=it.next();
                         %>
                         <option value=<%=pro.getId_asignatura()%>><%=pro.getAsignatura()+" profesor "+pro.getNombre()+" "+pro.getApellido()+" "+pro.getApellido_materno()%></option>
          <%}%>
   </select>
<button class="boton"  name="btn_elimina" id="grupo">ELIMINAR</button>
              </form>
            </div>

             
             
               
             </div>
             </div>
        
        </div>
       
        
        <script href="javascript/profesor.js"></script>
  
          
        </body>
</html>

