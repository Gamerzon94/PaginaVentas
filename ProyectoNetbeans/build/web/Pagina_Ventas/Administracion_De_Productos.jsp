<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Administración - Medal of Hardware</title>
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
    
    String accion = request.getParameter("accion");
    if(accion != null){
        if(accion.equals("1")){
            long idProducto = Long.parseLong(request.getParameter("id"));
            Connection conn = ConexionBD.getConexion();
            String sql_2 ="delete from inacap.producto where idproducto = ?";
            PreparedStatement pst_2 = conn.prepareStatement(sql_2);
            pst_2.setLong(1, idProducto);
            pst_2.execute();
        }
    }
    
%>


<%
ResultSet rs = null;
try{
Connection conn = ConexionBD.getConexion();
String sql = "select p.IDPRODUCTO,p.NOMBRE_PRODUCTO,m.NOMBRE_MARCA,c.NOMBRE_CATEGORIA,p.STOCK,p.FECHAREGISTRO,p.PRECIO,DESCRIPCION from INACAP.PRODUCTO p join INACAP.MARCA m on m.IDMARCA = p.IDMARCA join inacap.CATEGORIA c on p.IDCATEGORIA = c.IDCATEGORIA";
PreparedStatement pst = conn.prepareStatement(sql);
rs = pst.executeQuery();
}catch(Exception e){
    out.println("Error al cargar Administracion_De_Productos "+e.getMessage() );
}
%>
    <body>
        <%@include file="../banner/banner3.jsp" %>
        <h1>Lista De Productos</h1>
        
        <table width="1000" hight="200" border="1" align="center" class="trow1">
            <tr>
                <td>ID</td>
                <td>Nombre Producto</td>
                <td>Marca</td>
                <td>Categoria</td>
                <td>Stock</td>
                <td>Fecha de Registro</td>
                <td>Precio</td>
                <td>Descripción</td>
                <td>Acciones</td>
            </tr>
            <%while(rs.next()) {%>
            <tr>
                <td><%=rs.getString("idProducto")%></td>
                <td><%=rs.getString("NOMBRE_PRODUCTO")%></td>
                <td><%=rs.getString("NOMBRE_MARCA")%></td>
                <td><%=rs.getString("NOMBRE_CATEGORIA") %></td>
                <td><%=rs.getLong("STOCK")%></td>
                <td><%=rs.getDate("FECHAREGISTRO")%></td>
                <td><%=rs.getLong("PRECIO")%></td>
                <td><%=rs.getString("DESCRIPCION")%></td>
                <td>
            <a href="Administracion_De_Productos.jsp?accion=1&id=<%=rs.getLong("IDPRODUCTO") %>">    
                <img src="../img/eliminar.png" />
            </a>
                
                <a href="FormularioModificarProducto.jsp?idProducto=<%=rs.getLong("IDPRODUCTO")%>">
                    <img src="../img/modificar.gif" />
                </a>
        </td>   
            </tr>
            <%}%>
        </table>
    </body>
</html>
