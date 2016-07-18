<%@page import="java.sql.*,Conexion.*" %>
<%
    long idUsuario = Long.parseLong(request.getParameter("idUsuario"));
    long idPost = Long.parseLong(request.getParameter("idPost"));
    long idReplica = Long.parseLong(request.getParameter("idReplica"));
    String mensaje = request.getParameter("mensaje");
    
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="UPDATE REPLICA SET CONTENIDO = ? WHERE IDREPLICA = ?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, mensaje);
        pst.setLong(2, idReplica);
        pst.execute();
        response.sendRedirect("Post.jsp?accion=1&id="+idPost);
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }

%>