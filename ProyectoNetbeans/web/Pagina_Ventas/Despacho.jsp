<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Despachos</title>
    </head>
<%
    ResultSet rs = null;
    HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") && ! hs.getAttribute("rol").equals("Vendedor"))
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    int idUsuario = Integer.parseInt(hs.getAttribute("usuario").toString());
    
    String accion = request.getParameter("accion");
    if(accion != null){
        if(accion.equals("1")){
            try{
                long idVenta = Long.parseLong(request.getParameter("id"));
                Connection conn = ConexionBD.getConexion();
                String sql_1= "UPDATE VENTA SET  ESTADO = ?, idVendedor = ? WHERE IDVENTA = ?";
                PreparedStatement pst_1 = conn.prepareStatement(sql_1);
                pst_1.setString(1,"R");
                pst_1.setLong(2,idUsuario);
                pst_1.setLong(3,idVenta);
                pst_1.execute();
            }catch(Exception e){
                out.println("Error al Cargar Despacho " + e.getMessage());
            }
        }else if (accion.equals("2")){
            try{
                long idVenta = Long.parseLong(request.getParameter("id"));
                Connection conn = ConexionBD.getConexion();
                String sql_1= "UPDATE VENTA SET  ESTADO = ?, idVendedor = ? WHERE IDVENTA = ?";
                PreparedStatement pst_1 = conn.prepareStatement(sql_1);
                pst_1.setString(1,"A");
                pst_1.setLong(2,idUsuario);
                pst_1.setLong(3,idVenta);
                pst_1.execute();
            }catch(Exception e){
                out.println("Error al Cargar Despacho " + e.getMessage());
            }
        }
    }
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "select venta.IDVENTA, VENTA.IDUSUARIO, VENTA.TOTALVENTA, VENTA.ESTADO, USUARIO.NOMBRE,USUARIO.APELLIDO ,USUARIO.RUN from venta inner join USUARIO on VENTA.IDUSUARIO = USUARIO.IDUSUARIO ORDER BY VENTA.IDVENTA";
        PreparedStatement pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
    }catch(Exception e){
        out.println("Error al Cargar Despacho " + e.getMessage());
    }
%>
    <body>
        <%@include file="../banner/banner4.jsp" %>
        <center><h1>Estado de Despachos</h1></center>
        <table width="1000" hight="200" border="1" align="center" class="trow1">
            <tr>
                <td>Pedido</td>
                <td>Run</td>
                <td>Nombre</td>
                <td>Total a Pagar</td>
                <td>Estado</td>
                <td>Acciones</td>
            </tr>
            <% while(rs.next()) { %>
                <tr>
                    <td>
                        #<%=rs.getLong("idVenta") %>
                    </td>
                    <td>
                        <%=rs.getString("RUN") %>
                    </td>
                    <td>
                        <%=rs.getString("APELLIDO")+", "+rs.getString("NOMBRE") %>
                    </td>
                    <td>
                        $<%=rs.getLong("TOTALVENTA") %>
                    </td>
                    <td>
                        <% if(rs.getString("ESTADO").equals("P")){ %>
                            Pendiente de Validacion
                            <%} else if(rs.getString("ESTADO").equals("R")) {%>
                            Rechazado
                            <%}else{%>
                            Aprobado
                            <%}%>
                    </td>
                    <td>
                        <a href="Detalle.jsp?accion=1&id=<%=rs.getLong("idVenta") %>">Detalles</a>
                        <a href="Despacho.jsp?accion=1&id=<%=rs.getLong("idVenta") %>">Rechazar</a>
                        <a href="Despacho.jsp?accion=2&id=<%=rs.getLong("idVenta") %>">Aprobar</a>
                    </td>
                </tr>
            <%}%>
        </table>
    </body>
</html>
