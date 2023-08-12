<%-- 
    Document   : inscripcion
    Created on : 11/08/2023, 10:58:22 PM
    Author     : julio
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Asignatura_inscripcion"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.AsignaturaInscrDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.Conexion"%>
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
           
            <div class="filt">
                <div class="encabezado">
                <h2>consultas de alumnos elige una opcion   </h2>
               
                </div>
            
            
                <form action="ServMuestraInscr1" class="form_grupo" method="GET">
                 
                    <label class="form_label" for="grupo">asignatura</label> 
                
                   
                     <select name="asignatura" id="asignatura">
                     <option value="elige unan opcion"></option>
                           <%
         
                      
                      Conexion con = new Conexion();
                      Connection cnx=con.conectar();
                       try{
                      PreparedStatement pst;
                      ResultSet rs;
           pst=cnx.prepareStatement("select asig.asignatura,prof.nombre,prof.apellidoP,prof.apellidoM from asignatura"
                   + "  asig inner join profesor prof on asig.id_profesor=prof.id_profesor");
           rs=pst.executeQuery();
           while (rs.next()) {
               %>
               <option value="<%=rs.getString("asignatura")%>"><%=rs.getString("asignatura")+rs.getString("nombre")%></option>
             <%
              
                            
           }
         
       } catch (Exception ex) {
         
       }
                 
               %> 
                    
                     
                   

      </select>
<button class="boton"  name="btn_asignatura" id="grupo">buscar</button>
                 </form>
            
                <form action="ServMuestraInscr1" class="form_grupo" method="GET">
                 
                    <label class="form_label" for="nivel">matricula del alumno</label> 
                  <input type="text" name="matricula">
                        <button class="boton"  name="btn_matricula" id="btn_matricula">buscar</button>
            </form>
            <div class="tab">
            <table>
          
            <tr>
                <th colspan="2">Nombre</th>
                
                <th>Asignatura</th>
                <th>Estatus</th>
                <th>Editar</th>
            </tr>
           <%
                Iterator<Asignatura_inscripcion>iter=null;
                      String asignature=(String)request.getAttribute("asignaturaEnviada");
                       String matricula=(String)request.getAttribute("matriculaEnviada");
                      AsignaturaInscrDao dao=new AsignaturaInscrDao();
                      if(asignature!=null){
                           List<Asignatura_inscripcion>asig=dao.listaAsignaturas(asignature);
                              
                           iter=asig.iterator();
                      }else{
                   
                     List<Asignatura_inscripcion>matr=dao.listaMatricula(matricula);
                    iter=matr.iterator();
                      }
                        Asignatura_inscripcion per=null;
                     while (iter.hasNext()) {
                             per=iter.next();
                               %>
                                 <tr>
                              <td colspan="2"><%=per.getNombre()%></td>
                              
                                    <td><%=per.getAsignatura()%></td>
                            <td><%=per.getEstatus()%></td>
                            <td><button class="boton"><a  href="ServMuestraInscr1?txtID=<%=per.getId()%>" >Editar</a></button>
                        </tr>
                     <%
                     }
                     %>
                  </table> 
            </div>
             </div>
           </div>
     </body>
</html>