<%@page import="java.sql.*,Conexion.*" %>
<%
    long id = Long.parseLong(request.getParameter("id"));
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "DELETE FROM INACAP.REPLICA WHERE IDREPLICA = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, id);
        pst.execute();
        response.sendRedirect("index.jsp");
    }catch(Exception e){
        out.print("Excepci�n de SQL: " + e);
        return;
    }
%>
