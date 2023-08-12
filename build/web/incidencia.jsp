<%-- 
    Document   : incidencia
    Created on : 11/08/2023, 10:57:20 PM
    Author     : julio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Incidence_al"%>
<%@page import="modeloDAO.Incidence_al_dao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Incidence_prof"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.Incidence_prof_dao"%>
<%@page import="modelo.Incidence"%>
<%@page import="modeloDAO.IncidenceDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="styles/style_incidencia.css">
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
               <div class="left">
               
        <div class="form_group">

            <form method="GET" action="ServIncidence">
                <h3>incidencias</h3>
                <label for="alumno">Alumnos</label>
                <input type="radio" name="opcion" value="alumno">
               <label for="prof">Profesores</label>
               <input type="radio" name="opcion" value="profesor" >
               <label for="se">General</label>
              <input type="radio" name="opcion" value="SE" ><br>


<input type="date" name="f1" placeholder="fecha inicio">
<input type="date" name="f2" placeholder="fecha fin">
<input type="text" name="matricula" placeholder="matricula">
<button  class="boton" name="btn_check_fecha">Buscar</button>
</form>
               <button class="btn_lat"><a href="agregar_incidencia.jsp"><h2>Agregar </h2></a></button>
        </div>
               </div>
               <div class="right">
                  <table>
                   
                    <tr>
                        <th colspan="2">Nombre</th>
                        <th>Incidecnia</th>
                        <th>Fecha</th>
                        <th>Editar</th>
                    </tr>
                    <%
                        
                    
                       String f1=(String)request.getAttribute("ff1");
                        String f2=(String)request.getAttribute("ff2");
                          String matricula=(String)request.getAttribute("matr");
                          String opcion=(String)request.getAttribute("opc");
                  
                          
                          Incidence_prof_dao dao_prof=new Incidence_prof_dao();
                          List<Incidence_prof> inci=dao_prof.mostrarIncidence(f1, f2,matricula);
                          List<Incidence_prof> inciX=dao_prof.mostrarIncidence(f1, f2);
                          Iterator <Incidence_prof>itera_prof=inci.iterator();
                            Iterator <Incidence_prof>itera_profX=inciX.iterator();
                      
                           Incidence_al_dao dao_al=new Incidence_al_dao();
                           List<Incidence_al> inci_al=dao_al.mostrarIncidence(f1, f2,matricula);
                           List<Incidence_al> inci_alX=dao_al.mostrarIncidence(f1, f2);
                           Iterator<Incidence_al>itera_al=inci_al.iterator();
                            Iterator<Incidence_al>itera_alX=inci_alX.iterator();
                           
                            IncidenceDao dao_se= new IncidenceDao();
                            List<Incidence> inci_se=dao_se.mostrarIncidence(f1, f2);
                            Iterator<Incidence>itera=inci_se.iterator();
                      
                         
                    
                        Incidence_prof profX=null;
                        Incidence_al alumno=null;
                          Incidence_prof profY=null;
                        Incidence_al alumnoY=null;
                        Incidence SE=null;
                          while (itera_prof.hasNext()&&opcion.equalsIgnoreCase("profesor")) {
                         
                         profX=itera_prof.next();
                         
                         
%>
                         <tr>
                          <td><%=profX.getNombre()%></td> 
                             <td><%=profX.getIncidence()%></td> 
                            <td><%="fecha "+profX.getDate1()%></td>
                                <td><button class="boton"><a href="ServIncidence?ProfId_incidence=<%=profX.getId()%>" >Editar</a></button></td>
                             </tr>
          
    
                       <%}  while (itera_al.hasNext()&&opcion.equalsIgnoreCase("alumno")) {
                         
                         alumno=itera_al.next();
                         
                         
%>
                         <tr>
                          <td><%=alumno.getNombre()%></td>
                           
                          <td><%=alumno.getIncidence()%></td>
                            <td><%="fecha "+alumno.getDate1()%></td>
                          <td><button class="boton"><a href="ServIncidence?AlumnoId_incidence=<%=alumno.getId()%>" >Editar</a></button></td>
                             </tr>
          
    
                       <%}  while (itera.hasNext()&&opcion.equalsIgnoreCase("SE")) {
                         
                         SE=itera.next();
                         
                         
%>
                         <tr>
                          <td><%=SE.getNombre()%></td>
                             <td><%=SE.getIncidence()%></td>
                                <td><%="fecha "+SE.getDate1()%></td>
                                <td><button class="boton"><a href="ServIncidence?SeId_incidence=<%=SE.getId()%>" >Editar</a></button></td>
                             </tr>
          
    
                       <%}while (itera_profX.hasNext()&&opcion.equalsIgnoreCase("profesor")&&matricula.isEmpty()) {
                         
                         profX=itera_profX.next();
                         
                         
%>
                         <tr>
                          <td><%=profX.getNombre()%></td>
                             <td><%=profX.getIncidence()%></td>
                               <td><%="fecha "+profX.getDate1()%></td>
                             <td><button class="boton"><a href="ServIncidence?ProfId_incidence=<%=profX.getId()%>" >Editar</a></button></td>
                             </tr>
          
    
                       <%}   while (itera_alX.hasNext()&&opcion.equalsIgnoreCase("alumno")&&matricula.isEmpty()) {
                         
                         alumno=itera_alX.next();
                         
                         
%>
                         <tr>
                          <td><%=alumno.getNombre()%></td>
                           <td><%=alumno.getIncidence()%></td>
                           <td><%="fecha "+alumno.getDate1()%></td>
                                <td><button class="boton"><a href="ServIncidence?AlumnoId_incidence=<%=alumno.getId()%>" >Editar</a></button></td>
                             </tr>
          
    
                       <%}
                       
                       %>
                 
                      
                  </table>
                
               </div>
            </div>
        </div>
        
       
   
    
          
        </body>
</html>

