<%@page import="java.sql.*,Conexion.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Administracion de productos - Medal of Hardware</title>
    </head>
<%
    HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") && ! hs.getAttribute("rol").equals("Editor"))
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    ResultSet rs= null;
    ResultSet rs_2 = null;
    Connection conn = ConexionBD.getConexion();
    try{
        String sql= "Select * from marca";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        String sql_2="Select * from Categoria";
        Statement st_2 = conn.createStatement();
        rs_2 = st_2.executeQuery(sql_2);
    }catch(Exception e){
        out.println("Error SQL : "+e);
        return;
    }
%>
    <body>
        <%@include file="../banner/banner6.jsp" %>
        <center>
            <h1>Registro de Productos</h1>
            <table border="0" cellspacing="0" cellpadding="5" class="tborder">
                <form action="Guardar_Producto.jsp" method="post"> 
                <tr><td class="thead">
                        Nombre: </td><td class="thead">
                        <input type="text" name="nomProducto" size="30" /></td></tr>
                <tr><td class="thead">
                        Marca:</td><td class="thead">
                        <select name="idMarca">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs.next()){%>
                    <option value="<%=rs.getLong("idMarca")%>">
                            <%=rs.getString("Nombre_Marca")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Categoria:</td><td class="thead">
                        <select name="idCategoria">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs_2.next()){%>
                    <option value="<%=rs_2.getLong("idCategoria")%>">
                            <%=rs_2.getString("Nombre_Categoria")%>
                    </option>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Stock:</td><td class="thead">
                        <input type="text" name="Stock" size="30" /></td></tr>
                <tr><td class="thead">
                        Precio: </td><td class="thead">
                        <input type="text" name="Precio" size="30" /></td></tr>
                <tr><td class="thead">
                        Ubicacion de la Imagen </td><td class="thead">
                        <input type="text" name="Imagen" size="30" /></td></tr>
                <tr>
                    <td class="thead">Descripción: </td>
                    <td><textarea rows="10" cols="50" name="Descripcion"></textarea></td>
                </tr>
                </table>
                    <br/><input type="submit" value="Guardar" /> 
        </form> </center>
	</body>
</html>


