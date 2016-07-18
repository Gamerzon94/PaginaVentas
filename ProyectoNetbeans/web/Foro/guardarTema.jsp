<%@page import="java.sql.*,Conexion.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    long id = Long.parseLong(request.getParameter("id"));
    String titulo = request.getParameter("titulo");
    String mensaje = request.getParameter("mensaje");
    if(titulo.trim().length() == 0){
        %>
        <script>   
        ErrorCrearPost('Error ingrese un titulo');
        </script>
        <% 
        return;
    }
    if(mensaje.trim().length()==0){
        %>
        <script>   
        ErrorCrearPost('Error ingrese un mensaje');
        </script>
        <% 
        return;
    }
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="insert into inacap.post (titulo,idAutor) values (?,?)";
        PreparedStatement pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
        pst.setString(1, titulo);
        pst.setLong(2, id);
        pst.execute();
        ResultSet rs = pst.getGeneratedKeys();
        rs.next();
        String sql2 = "insert into inacap.replica (contenido,idPost,idUReplica) values (?,?,?)";
        PreparedStatement pst2 = conn.prepareStatement(sql2);
        pst2.setString(1, mensaje);
        pst2.setLong(2, rs.getLong(1));
        pst2.setLong(3, id);
        pst2.execute();
        response.sendRedirect("index.jsp");
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }

%>