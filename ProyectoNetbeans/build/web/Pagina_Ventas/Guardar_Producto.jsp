<%@page import ="java.sql.*,Conexion.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
ResultSet rs = null;
String Nombre = request.getParameter("nomProducto");
String Marca = request.getParameter("idMarca");
String Categoria = request.getParameter("idCategoria");
String Stock = request.getParameter("Stock");
String precio = request.getParameter("Precio");
String Descripcion = request.getParameter("Descripcion");
String Imagen = request.getParameter("Imagen");

String arrStock[] = Stock.split(",");
String arrStock2[] = Stock.split(".");
String arrPrecio[] = precio.split(",");
String arrPrecio2[] = precio.split(".");
if(arrStock.length >=2){
    %>
    <script>
        ErrorIngresarProducto('Error: no se aceptan comas');
    </script>
    <%
    return;
}
if(arrStock2.length >=2){  
    %>
    <script>
        ErrorIngresarProducto('Error: no se aceptan puntos');
    </script>
    <%
    return;
}
if(arrPrecio.length >=2){
    %>
    <script>
        ErrorIngresarProducto('Error: no se aceptan comas');
    </script>
    <%
    return;
}
if(arrPrecio2.length >=2){
%>
    <script>
        ErrorIngresarProducto('Error: no se aceptan puntos');
    </script>
    <%
    return;
}

 if(Nombre.trim().length()==0)
    {
        %>
    <script>
        ErrorIngresarProducto('Error: el nombre del producto es obligatorio');
    </script>
    <%
        return;
    }
 if(Marca.trim().equals("0") ){
     
    %>
    <script>
        ErrorIngresarProducto('Error: la marca es obligatoria');
    </script>
    <%   
     return;
 }
 if(Categoria.trim().equals("0") ){
     
%>
    <script>
        ErrorIngresarProducto('Error: la categoria del producto obligatorio');
    </script>
    <%  

     return;
 }
 if((Stock.trim().length()==0) || Integer.parseInt(Stock)<= 0 ) {
     %>
    <script>
        ErrorIngresarProducto('Error: El stock del producto es obligatorio y no puede ser un valor negativo o cero');
    </script>
    <%  
     return;
 }
 if(precio.trim().length()==0 || Integer.parseInt(precio)<= 0 ){
%>
    <script>
        ErrorIngresarProducto('Error: El precio del producto es obligatorio y no puede ser un valor negativo o cero');
    </script>
    <%      
     return;
    }
 if(Descripcion.trim().length()==0 ){
%>
    <script>
        ErrorIngresarProducto('Error: La descripcion del producto es obligatorio!');
    </script>
    <%     
     return;
 }

if(Imagen.trim().length()==0)
    {
        %>
    <script>
        ErrorIngresarProducto('Error: la ubicacion de la imgen del producto es obligatoria');
    </script>
    <%
        return;
    }

try{
    
    Connection conn = ConexionBD.getConexion();
    String sql = "insert into inacap.producto (Nombre_producto,idMarca,idCategoria,Stock,Precio,Descripcion,imagen) values(?,?,?,?,?,?,?)";
    
    PreparedStatement pst = conn.prepareStatement(sql);
    
    pst.setString(1, Nombre);
    pst.setString(2, Marca);
    pst.setString(3, Categoria);
    pst.setString(4, Stock);
    pst.setString(5, precio);
    pst.setString(6, Descripcion);
    pst.setString(7, Imagen);
    
    pst.execute();
    
    %>
    <script>
        ErrorIngresarProducto('Ingreso exitoso!');
    </script>
    <%    
}catch(Exception e){
    out.println("Error al ingresar un producto "+e.getMessage());
}

%>