<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<% 
    HttpSession s= request.getSession(false);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body >
        <center><a href="../index.jsp"><img src="../img/logo.png" width="10%"/></a></center>
        <% if(! (s == null || s.getAttribute("rol") == null )) { %>
        Bienvenido <%=s.getAttribute("apellido")+", "+s.getAttribute("nombre") %>
        <%}%>
        <div id="navbar">
            <span class="inbar">
                <ul>
                    <% if(! (s == null || s.getAttribute("rol") == null )) { %>
                    <li><a href="../index.jsp"><span>Tienda</span></a></li>
                    <li><a href="../Foro/index.jsp"><span><img src="../img/forum-icon.png"/>&nbsp;Foro</span></a></li>
                    <%if(s.getAttribute("rol").equals("Administrador")){%>
                    <li><a href="../Sesiones/AdministracionUsuarios.jsp"><span>Gestion de Usuario</span></a></li>
                    <li><a href="../Mensajeria/Mensajes.jsp"><span>Mensajes</span></a></li><%}%>
                    <%if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Editor")){%>
                    <li  class="navhome"><a href="Ingreso_Productos.jsp"><span>Agregar Productos</span></a></li>
                    <li><a href="Administracion_De_Productos.jsp"><span>Gestion de Productos</span></a></li><%}%>
                    <%if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Vendedor")){%>
                    <li><a href="Despacho.jsp"><span>Ventas</span></a></li><%}%>
                    <li><a href="Historial.jsp"><span>Sus Pedidos</span></a></li>
                    <li><a href="../Sesiones/CerrarSesion.jsp"><span>Cerrar Sesion</span></a></li>
                    <%}else{%>
                    <li><form action="../Sesiones/ValidarUsuario.jsp">
                        &nbsp;RUN:
                        <input type="text" name="run" size="30"/>
                        Clave usuario:
                        <input type="password" name="claveUsuario" size="30" />
                        <input type="submit" value="Iniciar Sesión" />     
                    </form></li>
                    <li><a href="../Registro/TerminoCondiciones.jsp"><span><img src="../img/iconLogin.png"/> &nbsp;Registrarse</span></a></li>
                    <li><a href="../Mensajeria/NuevoMensaje.jsp"><span>Mensajes al Administrador</span></a>
                    <%}%>
                    <li><a href="../Informacion/VisionYMision.jsp"><span>Quienes Somos</span></a></li>
                </ul>
            </span>
        </div>
    </body>
</html>