<%@page import="java.sql.*,Conexion.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <title>Registro</title>
    </head>
<%
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    Connection conn = ConexionBD.getConexion();
    try
    {
        String sql      = "select * from inacap.cargo";
        Statement pst = conn.createStatement();
        rs = pst.executeQuery( sql ); 
        String sql2      = "select * from inacap.pais";
        pst = conn.createStatement();
        rs2 = pst.executeQuery( sql2 ); 
        String sql3      = "select * from inacap.preguntaSecreta";
        pst = conn.createStatement();
        rs3 = pst.executeQuery( sql3 ); 
        String sql4      = "select * from inacap.tipoCliente";
        pst = conn.createStatement();
        rs4 = pst.executeQuery( sql4 ); 
    }
    catch(Exception e)
    {
        out.print("Excepción de SQL: " + e);
        return;
    }
%>
    <body>
        <%@include file="../banner/banner7.jsp" %>
    <center>
        <h1>Registrar Usuario</h1>
        <table border="0" cellspacing="0" cellpadding="5" class="tborder">
            <form action="guardarUsuario.jsp" method="post">
                <tr><td class="thead">
                        Nombre: </td><td class="thead">
                        <input type="text" name="nomUsuario" size="30" /></td></tr>
                <tr><td class="thead">
                        Apellido: </td><td class="thead">
                        <input type="text" name="apeUsuario" size="30" /></td></tr>
                <tr><td class="thead">
                        Clave:</td><td class="thead">
                        <input type="password" name="claveUsuario" size="30" /></td></tr>
                <tr><td class="thead">
                        Repetir Clave:</td><td class="thead">
                        <input type="password" name="claveUsuario2" size="30" /></td></tr>
                <tr><td class="thead">
                        Email: </td><td class="thead">
                        <input type="text" name="emailUsuario1" size="30" /></td></tr>
                <tr><td class="thead">
                        Confirmar Email: </td><td class="thead">
                        <input type="text" name="emailUsuario2" size="30" /></td></tr>
                <tr><td class="thead">
                        RUN: </td><td class="thead">
                        <input type="text" name="run" size="30" /></td></tr>
                <tr><td class="thead">
                        Fono: </td><td class="thead">
                        <input type="text" name="fono" size="30" /></td></tr>
                <tr><td class="thead">
                        Fecha de Nacimiento: </td><td class="thead">
                        <input type="date" name="fNacimiento" size="30" /></td></tr>
                <tr><td class="thead">
                        Pais:</td><td class="thead">
                        <select name="idPais">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs2.next()){%>
                    <option value="<%=rs2.getLong("idPais")%>">
                            <%=rs2.getString("nomPais")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Ciudad: </td><td class="thead">
                        <input type="text" name="ciudad" size="30" /></td></tr>
                <tr><td class="thead">
                        Comuna: </td><td class="thead">
                        <input type="text" name="comuna" size="30" /></td></tr>
                <tr><td class="thead">
                        Direccion: </td><td class="thead">
                        <input type="text" name="direccion" size="30" /></td></tr>
                <tr><td class="thead">
                        Cargo:</td><td class="thead">
                        <select name="idCargo"> 
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs.next()){%>
                    <option value="<%=rs.getLong("idCargo")%>">
                            <%=rs.getString("nomCargo")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Tipo de Cliente:</td><td class="thead">
                        <select name="idTipoCliente"> 
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs4.next()){%>
                    <option value="<%=rs4.getLong("idTCliente")%>">
                            <%=rs4.getString("tipoClie")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Pregunta Secreta: </td><td class="thead">
                        <select name="idPregunta">  
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs3.next()){%>
                    <option value="<%=rs3.getLong("idPSecreta")%>">
                            <%=rs3.getString("pregunta")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Respuesta: </td><td class="thead">
                        <input type="text" name="respuesta" size="30" /></td></tr></table>
                    <br/><input type="submit" value="Ingresar al sitio" />  
                    </form>  </center>
    </body>
</html>
