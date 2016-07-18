<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
    </head>
    <body>
        <%@include file="../banner/banner.jsp" %>
        <center><h1>Ingreso de Usuarios Registrados</h1>
        <table border="0" cellspacing="0" cellpadding="5" class="tborder">
        <form action="ValidarUsuario.jsp">
            <tr><td class="thead">RUN:</td><td class="thead">
            <input type="text" name="run" size="30" /></td></tr>
            <tr><td class="thead">Clave usuario:</td><td class="thead">
            <input type="password" name="claveUsuario" size="30" /></td></tr></table>
        <br><input type="submit" value="Iniciar Sesión" />       
        </form></center>
    </body>
</html>
