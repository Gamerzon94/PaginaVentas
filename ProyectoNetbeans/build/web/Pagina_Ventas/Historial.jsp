<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Historal - Medal of Hardware</title>
    </head>
        <%
            ResultSet rs = null;
            HttpSession hs = request.getSession(false);
            if(  hs == null || hs.getAttribute("rol") == null)
            {
                out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
                out.println("<br /><br />");
                out.println("<a href='../index.jsp'>Volver al login</a>");
                return;
            }
            int idUsuario = Integer.parseInt(hs.getAttribute("usuario").toString());
            try{
                Connection conn = ConexionBD.getConexion();
                String sql = "SELECT VENTA.IDVENTA, VENTA.FECHAREGISTRO, VENTA.ESTADO, VENTA.TOTALVENTA FROM VENTA WHERE IDUSUARIO = ?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setLong(1, idUsuario);
                rs = pst.executeQuery();
            }catch(Exception e){
                out.println("Error al Cargar Historial " + e.getMessage());
            }
        %>
    <body>
        <%@include file="../banner/banner5.jsp" %>
        <center><h1>Historial de sus pedidos</h1></center>
        <table width="1000" hight="200" border="1" align="center" class="trow1">
            <tr>
                <td>Pedido</td>
                <td>Fecha</td>
                <td>Estado</td>
                <td>Total</td>
                <td></td>
            </tr>
            <% while(rs.next()) { %>
                <tr>
                    <td>#<%=rs.getString("IDVENTA")%></td>
                    <td><%=rs.getString("FECHAREGISTRO")%></td>
                    <td><% if(rs.getString("ESTADO").equals("P")){ %>
                            Pendiente de Validacion
                            <%} else if(rs.getString("ESTADO").equals("R")) {%>
                            Rechazado
                            <%}else{%>
                            Aprobado
                            <%}%></td>
                    <td>$<%=rs.getString("TOTALVENTA")%></td>
                    <td><a href="Detalle.jsp?id=<%=rs.getLong("idVenta") %>">Detalles</a></td>
                </tr>
            <%}%>
        </table>
    </body>
</html>
