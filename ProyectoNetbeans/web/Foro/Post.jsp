<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<% 
    HttpSession hs = request.getSession(false);
    String accion = request.getParameter("accion");
    ResultSet rs= null;
    ResultSet rs2= null;
    int id = Integer.parseInt(request.getParameter("id"));
    if(accion != null){
        try{
            Connection conn = ConexionBD.getConexion();
            String sql="select replica.IDREPLICA, replica.CONTENIDO, replica.IDPOST, replica.IDUREPLICA, replica.FECHAREGISTRO, post.TITULO, USUARIO.NOMBRE, USUARIO.IDUSUARIO, CARGO.NOMCARGO FROM REPLICA inner join POST on REPLICA.IDPOST = POST.IDPOST inner join USUARIO on replica.IDUREPLICA = USUARIO.IDUSUARIO inner join cargo on USUARIO.IDCARGO = CARGO.IDCARGO WHERE POST.IDPOST = ? order by REPLICA.IDREPLICA";
            PreparedStatement pst = conn.prepareStatement(sql); 
            pst.setLong(1,id);
            rs = pst.executeQuery();
            String sql2 = "select * FROM POST WHERE IDPOST=?";
            PreparedStatement pst2 = conn.prepareStatement(sql2); 
            pst2.setLong(1,id);
            rs2 = pst2.executeQuery();
            rs2.next();
        }catch(Exception e){
            out.print("Error al cargar post"+e);
        }
    }else{
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=rs2.getString("titulo")%></title>
    </head>
    <body>
        <%@include file="../banner/banner1.jsp" %>
        <% if(! (hs == null || hs.getAttribute("rol") == null )) { %>
            <table width="1000" hight="200" align="center" class="trow1">
                <tr>
                    <td width="250">Autor</td>
                    <td>Contenido</td>
                </tr>
                <%while(rs.next()) {%>
                <tr>    
                <form action="ModificarMensaje.jsp" method="post">
                    <input type="hidden" name="idPost" value="<%=rs.getString("idPost")%>"/>
                    <input type="hidden" name="idReplica" value="<%=rs.getString("idReplica")%>"/>
                    <td width="250">Usuario: <%=rs.getString("nombre")%><br/>Cargo: <%=rs.getString("NOMCARGO") %><br/>Fecha Publicacion: <%=rs.getString("fecharegistro") %></td>
                    <td><%=rs.getString("Contenido")%><input type="hidden" name="contenido" value="<%=rs.getString("Contenido")%>"/><br/>
                        <%if(hs == null || hs.getAttribute("rol") == null){}else if((hs.getAttribute("usuario").equals(rs.getString("IDUSUARIO"))) || hs.getAttribute("rol").equals("Administrador") || (hs.getAttribute("rol").equals("Editor"))){%>
                        <br/><input type="submit" value="Modificar Mensaje"</td><%} if(hs == null || hs.getAttribute("rol") == null){}else if(hs.getAttribute("rol").equals("Administrador") || (hs.getAttribute("rol").equals("Editor"))){%><br/><br/><input type="button" value="Eliminar Mensaje" onclick = "location='EliminarReplica.jsp?id=<%=rs.getString("idReplica")%>'">
                    <%}%>
                </form>
                </tr>
                <% } %>
            </table>
                <br/><%  if(  hs == null || hs.getAttribute("rol") == null){}else{%><%if(hs.getAttribute("rol").equals("Administrador") || (hs.getAttribute("rol").equals("Editor"))){%><input type="button" value="Eliminar Tema" onclick = "location='EliminarPost.jsp?id=<%=id%>'">&nbsp;<%}%><input type="button" value="Responder Tema" onclick = "location='NuevaReplica.jsp?id=<%=id%>'">&nbsp;<%}%></td><input type="button" value="Volver al foro" onclick = "location='index.jsp'">
        </form>
        <%}else{%>
            <center><h1>Debe Iniciar Sesión para ver el contenido.</h1></center>
        <%}%>
    </body>
</html>
