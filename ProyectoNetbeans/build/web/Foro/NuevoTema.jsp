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


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear nuevo tema</title>
    </head>
    <body>
        <%@include file="../banner/banner1.jsp" %>
        <table>
            <form action="guardarTema.jsp" method="post">
                <input type="hidden" name="id" value="<%=usuario%>"/>
                <tr>
                    <td>Titulo: </td>
                    <td><input type="text" name="titulo" size="49"  /></td>
                </tr>
                <tr>
                    <td>Tu Mensaje: </td>
                    <td><textarea rows="10" cols="50" name="mensaje"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Publicar Tema"  /></td>
                </tr>
            </form>
        </table>
    </body>
</html>
