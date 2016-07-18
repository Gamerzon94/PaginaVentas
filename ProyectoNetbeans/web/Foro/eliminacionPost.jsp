<%@page import="java.sql.*,Conexion.*" %>
<%
    long id = Long.parseLong(request.getParameter("id"));
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "DELETE FROM INACAP.REPLICA WHERE IDPOST = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, id);
        pst.execute();
        String sql2 = "DELETE FROM INACAP.POST WHERE IDPOST = ?";
        PreparedStatement pst2 = conn.prepareStatement(sql2);
        pst2.setLong(1, id);
        pst2.execute();
        response.sendRedirect("index.jsp");
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }
%>