<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%
    HttpSession hs = request.getSession(false); 
    if(  hs == null || hs.getAttribute("rol") == null )
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }   
    long usuario = Long.parseLong(hs.getAttribute("usuario").toString());
    long idPost = Long.parseLong(request.getParameter("idPost"));
    long idReplica = Long.parseLong(request.getParameter("idReplica"));
    String contenido = request.getParameter("contenido");


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <title>Crear nuevo tema</title>
    </head>
    <body>
        <%@include file="../banner/banner1.jsp" %>
        <table>
            <form action="modificarReplica.jsp" method="post">
                <input type="hidden" name="idUsuario" value="<%=usuario%>"/>
                <input type="hidden" name="idPost" value="<%=idPost%>"/>
                <input type="hidden" name="idReplica" value="<%=idReplica%>"/>
                <tr>
                    <td>Tu Mensaje: </td>
                    <td><textarea rows="10" cols="50" name="mensaje"><%=contenido%></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Modificar Mensaje" /></td>
                </tr>
            </form>
        </table>
    </body>
</html>
