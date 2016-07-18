<%@page import="java.sql.*,Conexion.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <title>Modificar Usuario</title>
    </head>
<%
    String id = request.getParameter("idUsuario");
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    ResultSet rs5 = null;
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
        String sql5     = "select * from inacap.usuario where idUsuario = "+id;
        pst = conn.createStatement();
        rs5 = pst.executeQuery(sql5);
    }
    catch(Exception e)
    {
        out.print("Excepción de SQL: " + e);
        return;
    }
    
%>
    <body>
        <%@include file="../banner/banner2.jsp" %>
        <center><h1>Modificar Usuario</h1>
        <%rs5.next();%>
        <table border="0" cellspacing="0" cellpadding="5" class="tborder">
        <form action="ModificarUsuario.jsp" method="post">
            <input type="hidden" name="id" value="<%=rs5.getString("idUsuario")%>"/>
            <tr><td class="thead">Nombre: </td><td class="thead">
            <input type="text" name="nombre" value="<%=rs5.getString("nombre")%>"/></td></tr>
            <tr><td class="thead">Apellido: </td><td class="thead">
            <input type="text" name="apellido" value="<%=rs5.getString("apellido")%>"/></td></tr>
            <tr><td class="thead">Contraseña: </td><td class="thead">
            <input type="password" name="pass" value="<%=rs5.getString("contrasena")%>"/></td></tr>
            <tr><td class="thead">Email: </td><td class="thead">
            <input type="text" name="email" value="<%=rs5.getString("email")%>"/></td></tr>
            <tr><td class="thead">RUN: </td><td class="thead">
            <input type="text" name="run" value="<%=rs5.getString("RUN")%>"/></td></tr>
            <tr><td class="thead">Fono: </td><td class="thead">
            <input type="text" name="fono" value="<%=rs5.getString("fono")%>"/></td></tr>
            <tr><td class="thead">Fecha de Nacimiento: </td><td class="thead">
            <input type="date" name="fNacimiento" value="<%=rs5.getString("fechaNacimiento")%>"/></td></tr>
            <tr><td class="thead">Pais:</td><td class="thead">
            <select name="idPais">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs2.next()){%>
                    <%if(rs5.getLong("idPais")==rs2.getLong("idPais")){%>
                    <option value="<%=rs2.getLong("idPais")%>" selected="selected">
                            <%=rs2.getString("nomPais")%>
                    </option><%}else{%>
                    <option value="<%=rs2.getLong("idPais")%>">
                            <%=rs2.getString("nomPais")%>
                    </option>
                    <%}%>
                    <%}%>
            </select></td></tr>
            <tr><td class="thead">Ciudad:</td><td class="thead">
            <input type="text" name="ciudad" value="<%=rs5.getString("ciudad")%>"/></td></tr>
            <tr><td class="thead">Comuna: </td><td class="thead">
            <input type="text" name="comuna" value="<%=rs5.getString("comuna")%>"/></td></tr>
            <tr><td class="thead">Direccion: </td><td class="thead">
            <input type="text" name="direccion" value="<%=rs5.getString("direccion")%>"/></td></tr>
            <tr><td class="thead">Cargo:</td><td class="thead">
            <select name="idCargo"> 
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs.next()){%>
                    <%if(rs5.getLong("idCargo")==rs.getLong("idCargo")){%>
                    <option value="<%=rs.getLong("idCargo")%>" selected="selected">
                            <%=rs.getString("nomCargo")%>
                    </option><%}else{%>
                    <option value="<%=rs.getLong("idCargo")%>">
                            <%=rs.getString("nomCargo")%>
                    </option>
                    <%}%>
                    <%}%>
            </select></td></tr>
            <tr><td class="thead">Tipo de Cliente: </td><td class="thead">
            <select name="idTipoCliente"> 
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs4.next()){%>
                    <%if(rs5.getLong("idTipoCliente")==rs4.getLong("idTCliente")){%>
                    <option value="<%=rs4.getLong("idTCliente")%>" selected="selected">
                            <%=rs4.getString("tipoClie")%>
                    </option><%}else{%>
                    <option value="<%=rs4.getLong("idTCliente")%>">
                            <%=rs4.getString("tipoClie")%>
                    </option>
                    <%}%>
                    <%}%>
            </select></td></tr>
            <tr><td class="thead">Pregunta Secreta:</td><td class="thead">
            <select name="idPregunta">  
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs3.next()){%>
                    <%if(rs5.getLong("idPreguntaSecreta")==rs3.getLong("idPSecreta")){%>
                    <option value="<%=rs3.getLong("idPSecreta")%>">
                            <%=rs3.getString("pregunta")%>
                    </option><%}else{%>
                    <option value="<%=rs3.getLong("idPSecreta")%>" selected="selected">
                            <%=rs3.getString("pregunta")%>
                    </option>
                    <%}%>
                    <%}%>
            </select></td></tr>
            <tr><td class="thead">Respuesta:</td><td class="thead">
            <input type="text" name="respuesta" value="<%=rs5.getString("respuestaSecreta")%>"/></td></tr></table>
            <br/><input type="submit" value="Modificar Usuario"/>
        </form></center>
    </body>
</html>
