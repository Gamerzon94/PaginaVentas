<%@page import="java.sql.*,Conexion.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    String nombre = request.getParameter("Nombre");
    String email = request.getParameter("Email");
    String telefono = request.getParameter("Telefono");
    //long telefono = Long.parseLong(request.getParameter("Telefono"));
    String titulo = request.getParameter("titulo");
    String mensaje = request.getParameter("mensaje");
    
    if(nombre.trim().length() ==0){
        %>
        <script>
            ErrorCrearMensaje('Error: El nombre no debe estar vacio');
            </script>
        <%
            return;
    }
    
    if(telefono.trim().length() ==0){
        %>
        <script>
            ErrorCrearMensaje('Error: El telefono no debe estar vacio');
            </script>
        <%
            return;
    }


    if(email.trim().length() ==0){
        %>
        <script>
            ErrorCrearMensaje('Error: El email no debe estar vacio');
            </script>
        <%
            return;
    }

    if(titulo.trim().length() ==0){
        %>
        <script>
            ErrorCrearMensaje('Error: El titulo no debe estar vacio');
            </script>
        <%
            return;
    }
    
     if(mensaje.trim().length() ==0){
        %>
        <script>
            ErrorCrearMensaje('Error: El mensaje no debe estar vacio');
            </script>
        <%
            return;
    }


    String[] vEmail = email.split("@");
    if (vEmail.length!=2){
        %>
        <script>   
        ErrorCrearMensaje('Error al validar email, ingrese uno valido');
        </script>
        <%
            return;
    }

    
    
    
    
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="insert into inacap.Mensaje (titulo,mensaje,nombre,telefono,email) values (?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, titulo);
        pst.setString(2, mensaje);
        pst.setString(3, nombre);
        pst.setLong(4, Long.parseLong(telefono));
        pst.setString(5, email);
        pst.execute();
        %>
        <script>   
        UsuarioCreado('Mensaje enviado con exito, espere contacto del administrador');
        </script>
        <%
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }

%>