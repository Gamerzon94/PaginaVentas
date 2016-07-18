<%@page import="java.sql.*,Conexion.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    long idUsuario = Long.parseLong(request.getParameter("idUsuario"));
    long idPost = Long.parseLong(request.getParameter("idPost"));
    String mensaje = request.getParameter("mensaje");
    if(mensaje.trim().length() == 0){
     %>
     <script>
         ErrorCrearReplica('ERROR: Ingrese un mensaje',<%=idPost%>);
     </script>
     <%
         return; }
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="insert into inacap.replica (contenido,idPost,idUReplica) values (?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, mensaje);
        pst.setLong(2, idPost);
        pst.setLong(3, idUsuario);
        pst.execute();
        response.sendRedirect("Post.jsp?accion=1&id="+idPost);
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }

%>