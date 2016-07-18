<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido Foro</title>
    </head>
<%
    HttpSession hs = request.getSession(false);
    ResultSet rs= null;
    ResultSet rs2=null;
    
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="select post.IDPOST,post.TITULO, usuario.NOMBRE, post.FECHAREGISTRO, CARGO.NOMCARGO from POST inner join USUARIO on IDAUTOR = IDUSUARIO inner join cargo on USUARIO.IDCARGO = CARGO.IDCARGO order by IDPOST";
        PreparedStatement pst = conn.prepareStatement(sql); 
        rs = pst.executeQuery();
 
    }catch(Exception e){
        out.print("Excepción de SQL rs1 : " + e);
        return;
    }

%>
    <body>
        <%@include file="../banner/banner1.jsp" %>
        <% if(! (hs == null || hs.getAttribute("rol") == null )) { %>
        <%  if(  hs == null || hs.getAttribute("rol") == null){}else{%>
        <br/><div align="right"><input type="button" value="Publicar Tema" onclick = "location='NuevoTema.jsp'"></div><%}%>
        <table width="1000" hight="200" align="center" class="trow1">
            <tr>
                <td width="250" class="td1">Titulo / Autor</td>
                <td class="td1">Ultimo Mensaje</td>
            </tr>
            <%while(rs.next()){%>
            <tr>
                <td width="250"><a href="Post.jsp?accion=1&id=<%=rs.getLong("idPost")%>"><%=rs.getString("titulo")%></a><br/>Usuario: <%=rs.getString("nombre")%><br/>Cargo: <%=rs.getString("NOMCARGO") %><br/>Publicacion: <%=rs.getString("fecharegistro")%></td>
                <td> 
                    <%
                        try{
                            Connection conn = ConexionBD.getConexion();
                        String sql2="select u.NOMBRE, r.FECHAREGISTRO from replica r join USUARIO u on u.IDUSUARIO = r.IDUREPLICA where r.IDPOST ="+rs.getLong("idpost")+" order by FECHAREGISTRO  desc offset 0 rows fetch next 1 row only ";
                        PreparedStatement pst2 = conn.prepareStatement(sql2);
                        rs2 = pst2.executeQuery();
                        }catch(Exception e){
                             out.print("Excepción de SQL rs2: " + e);
                        }
                          
                        %>
                    <%while(rs2.next()){%>    
                    <%=rs2.getString("nombre")%><br/>
                    <%=rs2.getDate("FECHAREGISTRO") %>
                </td>
            </tr>
            <% } %>
            <%}%>
        </table>
        <%  if(  hs == null || hs.getAttribute("rol") == null){}else{%>
        <br/><div align="right"><input type="button" value="Publicar Tema" onclick = "location='NuevoTema.jsp'"></div><%}%>
        <%}else{%>
            <center><h1>Debe Iniciar Sesión para ver el contenido.</h1></center>
        <%}%>
    </body>
</html>
