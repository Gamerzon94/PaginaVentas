<%@page import ="java.sql.*,Conexion.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    ResultSet rs = null;
    String run ="";
    String nombre = request.getParameter("nomUsuario");
    String apellido = request.getParameter("apeUsuario");
    String clave1 = request.getParameter("claveUsuario");
    String clave2 = request.getParameter("claveUsuario2");
    String email = request.getParameter("emailUsuario1");
    String email2 = request.getParameter("emailUsuario2");
    run = request.getParameter("run");
    String fono = request.getParameter("fono");
    String fNacimiento = request.getParameter("fNacimiento");
    String pais = request.getParameter("idPais");
    String ciudad = request.getParameter("ciudad");
    String comuna = request.getParameter("comuna");
    String direccion = request.getParameter("direccion");
    String cargo = request.getParameter("idCargo");
    String tipoCliente = request.getParameter("idTipoCliente");
    String idPregunta = request.getParameter("idPregunta");
    String respuesta = request.getParameter("respuesta");

    if(nombre.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un nombre');
        </script>
        <% 
        return;
    }
    
    if(apellido.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un apellido');
        </script>
        <% 
            return;
    }
    
    if(clave1.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una contraseña');
        </script>
        <% 
            return;
    }
    
    if(clave2.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese la contraseña de confirmación');
        </script>
        <% 
            return;
    }
    
    if(email.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un email');
        </script>
        <% 
            return;
    }
    
    if(email2.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese el email de confirmación');
        </script>
        <% 
            return;
    }
    
    if(run.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un run');
        </script>
        <% 
            return;
    }
    
    if(fNacimiento.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una fecha de nacimiento');
        </script>
        <% 
            return;
    }
    
    if(comuna.trim().length()==0)
    {
       %>
        <script>   
        ErrorCrearCuenta('Error ingrese una comuna');
        </script>
        <% 
            return;
    }
    
    if(direccion.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una dirección');
        </script>
        <% 
            return;
    }   
    if(cargo.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un cargo');
        </script>
        <% 
            return;
    }
    
    if(fono.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese un telefono');
        </script>
        <% 
            return;
    }
    
    if(ciudad.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una ciudad');
        </script>
        <% 
            return;
    }
    if(comuna.trim().length()==0)
    {
       %>
        <script>   
        ErrorCrearCuenta('Error ingrese una comuna');
        </script>
        <% 
            return;
    }
    
    if(idPregunta.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una pregunta');
        </script>
        <% 
            return;
    }
    
    if(respuesta.trim().length()==0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error ingrese una respuesta');
        </script>
        <% 
            return;
    }
    
    if( ! email.trim().equals(email2.trim()))
    {
        %>
        <script>   
        ErrorCrearCuenta('Error los email ingresados no son iguales');
        </script>
        <%
            return;
    }
    
    if( ! clave1.trim().equals(clave2.trim()))
    {
        %>
        <script>   
        ErrorCrearCuenta('Error las claves ingresadas no son iguales');
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(pais)== 0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error debe ingresar un pais');
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(cargo)== 0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error debe ingresar un cargo');
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(idPregunta)== 0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error debe seleccionar una pregunta');
        </script>
        <%
            return;
    }
    
    if(Integer.parseInt(tipoCliente)== 0)
    {
        %>
        <script>   
        ErrorCrearCuenta('Error debe seleccionar un tipo de cliente');
        </script>
        <%
            return;
    }
    
    String[] vEmail = email.split("@");
    if (vEmail.length!=2){
        %>
        <script>   
        ErrorCrearCuenta('Error al validar email, ingrese uno valido');
        </script>
        <%
            return;
    }

    String[] vEmail2 = email2.split("@");
    if (vEmail2.length!=2){
        %>
        <script>   
        ErrorCrearCuenta('Error al validar email, ingrese uno valido');
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
        ErrorCrearCuenta('Error rut no valido');
        </script>
        <%
            return;
    }
    
    try
    {
        Connection conn = ConexionBD.getConexion();
        String sqlUsuarios      = "select * from inacap.usuario";
        Statement st = conn.createStatement();
        rs = st.executeQuery( sqlUsuarios ); 
        while(rs.next()){
            if((run.equals(rs.getString("run")))){
                %>
                <script>   
                ErrorCrearCuenta('Error rut ya registrado');
                </script>
        <%
            return;
            }
            
            if((email.equals(rs.getString("email")))){
                %>
                <script>   
                ErrorCrearCuenta('Error email ya registrado');
                </script>
        <%
            return;
            }
        }
        
        String sql = "insert into inacap.usuario (nombre, apellido, contrasena, email, run, fono, fechaNacimiento, direccion, idPais, ciudad, comuna, idCargo, idTipoCliente, estaActivo,idPreguntaSecreta,respuestaSecreta) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        PreparedStatement pst = conn.prepareStatement(sql); 
        
        pst.setString(1, nombre);
        pst.setString(2, apellido);
        pst.setString(3, clave1);    
        pst.setString(4, email); 
        pst.setString(5, run); 
        pst.setLong(6, Long.parseLong(fono)); 
        pst.setString(7, fNacimiento); 
        pst.setString(8, direccion); 
        pst.setLong(9, Long.parseLong(pais)); 
        pst.setString(10, ciudad); 
        pst.setString(11, comuna); 
        pst.setLong(12, Long.parseLong(cargo)); 
        pst.setLong(13, Long.parseLong(tipoCliente));
        pst.setString(14, "n"); 
        pst.setLong(15, Long.parseLong(idPregunta));
        pst.setString(16, respuesta);
        
        pst.execute();
        
        %> 
        <script>
            UsuarioCreado("Ingreso exitoso, Espere la validación por parte del administrado del sitio");
        </script>
        <%



        //out.println("Ingreso exitoso! " +
        //            "Espere la validación por parte del administrador del sitio...");
        //out.println("<a href='../index.jsp'>Volver al ingreso</a>");
    
    }catch(Exception e)
    {
    out.println("Exception de SQL: "+e);
    }
%>