<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear nuevo mensaje</title>
    </head>
    <body>
        <%@include file="../banner/banner10.jsp" %>
        En caso de no tener una cuenta y necesitar contacto con un administrador, favor dejanos tu mensaje con los datos que se indican a continuacion.
        <table>
            <form action="guardarMensaje.jsp" method="post">
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="Nombre" size="49"  /></td>
                </tr>
                <tr>
                    <td>Telefono: </td>
                    <td><input type="text" name="Telefono" size="49"  /></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" name="Email" size="49"  /></td>
                </tr>
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
                    <td><input type="submit" value="Enviar mensaje"  /></td>
                </tr>
            </form>
        </table>
    </body>
</html>
