<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../JS/JS.js" type="text/javascript"></script>
        <title>Administracion de Usuarios</title>
    </head>
<%
    
    HttpSession hs = request.getSession(false); 
                                                 
                                                 
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") )
    {
        %>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
                <script>
                    emergente('Error: Ud. no tiene los permisos para ingresar a esta página');
                    window.location.href='../index.jsp';
                </script>
                <%
        return;
    }   
    
    String accion = request.getParameter("accion");
    if(accion != null){
        if(accion.equals("1")){
            long idUsuario = Long.parseLong(request.getParameter("id"));
            Connection conn = ConexionBD.getConexion();
            
            String sql_1= "select estaactivo from inacap.usuario where idUsuario=?";
            PreparedStatement pst_1 = conn.prepareStatement(sql_1);
            pst_1.setLong(1,idUsuario);
            ResultSet rs_1 = pst_1.executeQuery();
            
            rs_1.next();
            if(idUsuario==1 || idUsuario== 5){
                %>
                <script>
                    emergente('Error: No puedes desactivar a este usuario');
                </script>
                <%
                
           }else{
                if(rs_1.getString("estaactivo").equals("s"))
                {
                    String sql_2 = "update inacap.Usuario set estaactivo=? where idUsuario=?";
                    PreparedStatement pst_2 = conn.prepareStatement(sql_2);

                    pst_2.setString(1,"n");
                    pst_2.setLong(2,idUsuario);  
                    pst_2.execute();
                }else{
                    String sql_2 = "update inacap.Usuario set estaactivo=? where idUsuario=?";
                    PreparedStatement pst_2 = conn.prepareStatement(sql_2);

                    pst_2.setString(1,"s");
                    pst_2.setLong(2,idUsuario);  
                    pst_2.execute();
                }
            }
        }else if (accion.equals("2")){
            
            long idUsuario = Long.parseLong(request.getParameter("id"));
            if(idUsuario == 1 || idUsuario == 5){
            %>
            <script>
               emergente('Error: No puedes eliminar a este usuario');
            </script>     
            <%
        //out.println("No se puede borrar a este usuario de la pagina.");
            }
            else{
                Connection conn = ConexionBD.getConexion();
                String sqlp = "select IDPOST FROM INACAP.POST WHERE IDAUTOR = ?";
                PreparedStatement pstp = conn.prepareStatement(sqlp);
                pstp.setLong(1, idUsuario);
                ResultSet rsp = pstp.executeQuery();
                while(rsp.next()){
                    String sqlp2 = "delete from inacap.replica where IDPOST = ?";
                    PreparedStatement pstp2 = conn.prepareStatement(sqlp2);
                    pstp2.setLong(1,rsp.getLong("IDPOST"));
                    pstp2.execute();
                    String sqlp3 = "delete from inacap.post where IDPOST = ?";
                    PreparedStatement pstp3 = conn.prepareStatement(sqlp3);
                    pstp3.setLong(1,rsp.getLong("IDPOST"));
                    pstp3.execute();
                }
                String sqlp4 = "delete from inacap.replica where IDUREPLICA = ?";
                PreparedStatement pstp4 = conn.prepareStatement(sqlp4);
                pstp4.setLong(1, idUsuario);
                pstp4.execute();
                String sql_3="delete from inacap.usuario where idUsuario=?";
                PreparedStatement pst_3 = conn.prepareStatement(sql_3);
                pst_3.setLong(1, idUsuario);
                pst_3.execute();   
            }   
        }
    }
%>

<%
    ResultSet rsU = null;

    try{
    Connection conn = ConexionBD.getConexion();
    String sql_2 = "select u.idUsuario,u.nombre, u.apellido, u.contrasena, u.email, u.run, u.fono, u.fechaNacimiento, u.direccion, u.comuna, u.ciudad, u.estaActivo, p.nomPais , c.nomcargo,t.tipoclie,pr.pregunta,u.respuestasecreta,u.fechaRegistro from Inacap.usuario u join Inacap.pais p on p.idPais = u.idpais join cargo c on c.idCargo = u.idcargo join tipocliente t on t.idTCliente = u.idtipocliente join preguntasecreta pr on pr.idPSecreta = u.idpreguntasecreta order by u.idUsuario";
    PreparedStatement pst = conn.prepareStatement(sql_2);
    rsU = pst.executeQuery();
}catch(Exception e){
    out.println(e.getMessage());
}
%>
    <body>
        <%@include file="../banner/banner2.jsp" %>
        <h1>Lista de Usuarios</h1>
        <table width="1000" hight="200" border="1" align="center" class="trow1">
    <tr> 
        <td>Id Usuario</td>
        <td>Run</td>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Contraseña</td>
        <td>Email</td> 
        <td>Fono</td>
        <td>Fecha De Nacimiento</td>
        <td>Direción</td>
        <td>Pais</td>
        <td>Comuna</td>
        <td>Ciudad</td>
        <td>Cargo</td>
        <td>Tipo de cliente</td>
        <td>Pregunta Secreta</td>
        <td>Respuesta Pregunta Secreta</td>
        <td>Fecha de registro</td>
        <td>Estado</td>
        <td>Acciones</td>
    </tr>    
        <%while(rsU.next()) {%>
    <tr>
        <td><%=rsU.getString("idUsuario")%></td>
        <td><%=rsU.getString("run")%></td>
        <td><%=rsU.getString("nombre")%></td>
        <td><%=rsU.getString("apellido")%></td>
        <td><%=rsU.getString("contrasena")%></td>
        <td><%=rsU.getString("email")%></td>
        <td><%=rsU.getLong("fono")%></td> 
        <td><%=rsU.getDate("fechaNacimiento")%></td>
        <td><%=rsU.getString("direccion") %></td>
        <td><%=rsU.getString("nomPais")%></td>
        <td><%=rsU.getString("comuna")%></td>
        <td><%=rsU.getString("ciudad")%></td>
        <td><%=rsU.getString("nomcargo") %></td>
        <td><%=rsU.getString("tipoclie") %></td>
        <td><%=rsU.getString("pregunta") %></td>
        <td><%=rsU.getString("respuestaSecreta") %></td>
        <td><%=rsU.getDate("fecharegistro") %></td>
        
        <td>
            <a href="AdministracionUsuarios.jsp?accion=1&id=<%=rsU.getLong("idUsuario") %>">          
            <%if(rsU.getString("estaActivo").equals("s")){%>
                 <img src="../img/circuloverde.png"/>
                 <%}else{%>
                 <img src="../img/circulorojo.png"/>
                 <%}%>
                 </a>
        </td>
        <td>
            <a href="AdministracionUsuarios.jsp?accion=2&id=<%=rsU.getLong("idUsuario") %>">    
                <img src="../img/eliminar.png" />
            </a>
                
                <a href="FormularioModificar.jsp?idUsuario=<%=rsU.getLong("idUsuario")%>">
                    <img src="../img/modificar.gif" />
                </a>
        </td>   
    </tr>
    <% } %>
    </table>
        
    <input type="button" value="Volver" onclick = "location='../index.jsp'">
        
    </body>
</html>
