<%@page import="java.sql.*,Conexion.*" %> 
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String pass = request.getParameter("pass");
    String email = request.getParameter("email");
    String run = request.getParameter("run");
    String fono = request.getParameter("fono");
    String fNacimiento = request.getParameter("fNacimiento");
    String idPais = request.getParameter("idPais");
    String ciudad = request.getParameter("ciudad");
    String comuna = request.getParameter("comuna");
    String direccion = request.getParameter("direccion");
    String idCargo = request.getParameter("idCargo");
    String idTipoCliente = request.getParameter("idTipoCliente");
    String idPreguntaSecreta = request.getParameter("idPregunta");
    String respuesta = request.getParameter("respuesta");
    
    if(nombre.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un nombre',<%=id%>);
        </script>
        <% 
        return;
    }
    
    if(apellido.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un apellido',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(pass.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una contraseña',<%=id%>);
        </script>
        <% 
            return;
    }
    
    
    if(email.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un email',<%=id%>);
        </script>
        <% 
            return;
    }
    
    
    if(run.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un run',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(fNacimiento.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una fecha de nacimiento',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(comuna.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una comuna',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(direccion.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una dirección',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(idCargo.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un cargo',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(fono.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese un telefono',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(ciudad.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una ciudad',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(comuna.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una comuna',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(idPreguntaSecreta.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una pregunta',<%=id%>);
        </script>
        <% 
            return;
    }
    
    if(respuesta.trim().length()==0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error ingrese una respuesta',<%=id%>);
        </script>
        <% 
            return;
    }
     
    if(Integer.parseInt(idPais)== 0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error debe ingresar un pais',<%=id%>);
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(idCargo)== 0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error debe ingresar un cargo',<%=id%>);
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(idPreguntaSecreta)== 0)
    {
         %>
        <script>   
        ErrorModificarCuenta('Error debe seleccionar una pregunta',<%=id%>);
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(idTipoCliente)== 0)
    {
        %>
        <script>   
        ErrorModificarCuenta('Error debe seleccionar un tipo de cliente',<%=id%>);
        </script>
        <%
            return;
    }

    String[] vEmail = email.split("@");
    if (vEmail.length!=2){
        %>
        <script>   
        ErrorModificarCuenta('Error al validar email, ingrese uno valido',<%=id%>);
        </script>
        <%
            return;
    }

    Boolean Validar = false;
    if(!run.isEmpty()){
    int car = run.length();
    int largo = run.length() - 3;
    int constante = 2 ;
    int suma = 0;
    int digito = 0;
    
    String[] vRun = run.split("-");   
    if(!(vRun.length != 2 ) ){
    for (int i = largo; i >=0; i--){
        suma= suma + Integer.parseInt(run.substring(i,i+1)) * constante;
        constante = constante + 1;
        if(constante ==8){
        constante =2; 
        }
    }
    String ult = run.substring(car-1).toUpperCase();
    digito = 11-(suma % 11);
    if (digito == 10 && ult.equals("K")){
        Validar = true;
    }else{
        if(digito ==11 && ult.equals("0")){
            Validar = true;
        }else{
            if (digito == Integer.parseInt(ult)){
            Validar = true;
            }
        }
    }
    }
}
    if (Validar== false){
        %>
        <script>   
        ErrorModificarCuenta('Error rut no valido',<%=id%>);
        </script>
        <%
            return;
    }
  
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "update inacap.usuario set nombre=?, apellido= ?, contrasena=?, email = ?, run= ?, fono = ?,fechaNacimiento=?,direccion=?,idPais=?,comuna=?, ciudad =?, idCargo=?, idTipoCliente=?,idPreguntaSecreta=?,respuestaSecreta=? where idUsuario=?"; 
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, nombre);
        pst.setString(2, apellido);
        pst.setString(3, pass);
        pst.setString(4, email);
        pst.setString(5, run);
        pst.setLong(6, Long.parseLong(fono));
        pst.setString(7, fNacimiento);
        pst.setString(8, direccion);
        pst.setLong(9, Long.parseLong(idPais));
        pst.setString(10,comuna);
        pst.setString(11,ciudad);
        pst.setLong(12,Long.parseLong(idCargo));
        pst.setLong(13,Long.parseLong(idTipoCliente));
        pst.setLong(14,Long.parseLong(idPreguntaSecreta));
        pst.setString(15, respuesta);
        pst.setLong(16,Long.parseLong(id));
        pst.execute();
        response.sendRedirect("AdministracionUsuarios.jsp");
    }catch(Exception e){
        out.print(e);
    }
%>