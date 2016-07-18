<%@page import="javax.servlet.http.HttpSession,java.sql.*  ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensajes para el administrador</title>
    </head>
    <%
        ResultSet rs = null;
        HttpSession hs = request.getSession(false);
        if(  hs == null || hs.getAttribute("rol") == null || (! hs.getAttribute("rol").equals("Administrador"))){
            out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
            out.println("<br /><br />");
            out.println("<a href='../index.jsp'>Volver al login</a>");
            return;
        }
        String accion = request.getParameter("accion");
        if(accion != null){
            if(accion.equals("1")){
                try{
                    long idMensaje = Long.parseLong(request.getParameter("id"));
                    Connection conn = ConexionBD.getConexion();
                    String sql_aux = "DELETE FROM MENSAJE WHERE IDMENSAJE = ?";
                    PreparedStatement pst_aux = conn.prepareStatement(sql_aux);
                    pst_aux.setLong(1, idMensaje);
                    pst_aux.execute();
                }catch(Exception e){
                    out.println("Error al Cargar Mensajes " + e.getMessage());
                }
            }
        }
        try{
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from MENSAJE";
            PreparedStatement pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
        }catch(Exception ex){
             out.println("Error al Cargar mensajes " + ex.getMessage());
        }
    %>
    <body>
        <%@include file="../banner/banner9.jsp" %>
        <center><h1>Mensajes para el Administrador</h1></center>
        <table width="1000" hight="200" border="1" align="center" class="trow1">
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Telefono</td>
                <td>Email</td>
                <td>Fecha</td>
                <td>Titulo</td>
                <td>Operaciones</td>
            </tr>
            <%while(rs.next()){%>
            <tr>
                <td><%=rs.getString("idMensaje") %></td>
                <td><%=rs.getString("nombre") %></td>
                <td><%=rs.getString("telefono") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("fechaRegistro") %></td>
                <td><%=rs.getString("titulo") %></td>
                <td><a href="Detalle.jsp?id=<%=rs.getLong("idMensaje") %>">Detalles</a>
                    <a href="Mensajes.jsp?accion=1&id=<%=rs.getLong("idMensaje") %>">Eliminar</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
