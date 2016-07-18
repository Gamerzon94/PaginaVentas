<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    HttpSession hs = request.getSession(false);
    String accion = request.getParameter("accion");
    ResultSet rs= null;
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "select * from usuario where idusuario = ?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setLong(1,id);
        rs = pst.executeQuery();
        if(rs.next()){
            
        }else{
            out.println("Usuario no encontrado.");
        }
    }catch(Exception e){
        out.print("Error al cargar post"+e);
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de <%=rs.getString("nombre")%> </title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    Nombre: <%= rs.getString("nombre") %>
                </td>
            </tr>
            <tr>
                <td>
                    Apellido: <%= rs.getString("apellido") %>
                </td>
            </tr>
            <tr>
                <td>
                    Fecha Registro: <%=rs.getString("fecharegistro") %>
                </td>
            </tr>
        </table>
    </body>
</html>
