<%@page import="java.sql.*,Conexion.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Modificar Producto - Medal of Hardware</title>
    </head>
<%
    String id= request.getParameter("idProducto");
    ResultSet rs = null;
    ResultSet rs_2 = null;
    ResultSet rs_3 = null;
    Connection conn = ConexionBD.getConexion();
    try{
        String sql = "Select * from inacap.producto where idProducto ="+id;
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        String sql2 = "Select * from inacap.Marca";
        Statement st2 = conn.createStatement();
        rs_2 = st2.executeQuery(sql2);
        
        String sql3 = "Select * from inacap.Categoria";
        Statement st3 = conn.createStatement();
        rs_3 = st3.executeQuery(sql3);
    }catch(Exception e){
        out.println("Error: Formulario Modifcar "+e.getMessage() );
    }

%>
    <body>
        <%@include file="../banner/banner3.jsp" %>
        <h1>Modificar Producto</h1>
        <%rs.next(); %>
        <table border="0" cellspacing="0" cellpadding="5" class="tborder">
            <form action="Modificar_Producto.jsp" method="post">
                <form action="Guardar_Producto.jsp" method="post"> 
                <tr><td class="thead">
                <input type="hidden" name="id" value="<%=rs.getString("idProducto")%>"/>
                        Nombre: </td><td class="thead">
                        <input type="text" name="nomProducto" size="30" value="<%=rs.getString("Nombre_producto")%>"/></td></tr>
                <tr><td class="thead">
                        Marca:</td><td class="thead">
                        <select name="idMarca">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs_2.next()){%>
                    <%if(rs_2.getLong("idMarca")==rs.getLong("idMarca")){%>
                    <option value="<%=rs_2.getLong("idMarca")%>" selected ="selected">
                            <%=rs_2.getString("Nombre_Marca")%>
                    </option><%}else{%>
                    <option value="<%=rs_2.getLong("idMarca")%>">
                            <%=rs_2.getString("Nombre_Marca")%>
                    </option>
                    <%}%>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Categoria:</td><td class="thead">
                        <select name="idCategoria">
                    <option value="0">
                            seleccione
                    </option>
                    <% while(rs_3.next()){%>
                    <%if(rs_3.getLong("idCategoria")==rs.getLong("idCategoria")){%>
                    <option value="<%=rs_3.getLong("idCategoria")%>" selected="selected">
                            <%=rs_3.getString("Nombre_Categoria")%>
                    </option><%}else{%>
                    <option value="<%=rs_3.getLong("idCategoria")%>">
                            <%=rs_3.getString("Nombre_Categoria")%>
                            </option>
                    <%}%>
                    <%}%>
                    </select></td></tr>
                <tr><td class="thead">
                        Stock:</td><td class="thead">
                        <input type="text" name="Stock" size="30" value="<%=rs.getString("Stock")%>" /></td></tr>
                <tr><td class="thead">
                        Precio: </td><td class="thead">
                        <input type="text" name="Precio" size="30" value="<%=rs.getString("Precio")%>" /></td></tr>
                <tr>
                    <td class="thead">Descripción: </td>
                    <td><textarea rows="10" cols="50" name="Descripcion"><%=rs.getString("Descripcion")%></textarea></td>
                </tr>
                </table><br/><input type="submit" value="Modificar Producto"/>
                </form>
    </body>
</html>
