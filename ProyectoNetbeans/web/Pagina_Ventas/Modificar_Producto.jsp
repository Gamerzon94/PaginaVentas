<%@page import="java.sql.*,Conexion.*" %> 
<script src="../JS/JS.js" type="text/javascript"></script>
<%
    HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") && ! hs.getAttribute("rol").equals("Editor"))
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    String Id = request.getParameter("id");
    String Nombre = request.getParameter("nomProducto");
    String Marca = request.getParameter("idMarca");
    String Categoria = request.getParameter("idCategoria");
    String Stock = request.getParameter("Stock");
    String Precio = request.getParameter("Precio");
    String Descripcion = request.getParameter("Descripcion");
    
    String arrStock[] = Stock.split(",");
    String arrStock2[] = Stock.split(".");
    String arrPrecio[] = Precio.split(",");
    String arrPrecio2[] = Precio.split(".");
    if(arrStock.length >=2){
        %>
        <script>
            ErrorModificarProducto('Error:No se aceptan comas',<%=Id%>);
        </script>
        <%
    return;
    }
    if(arrStock2.length >=2){
    %>
        <script>
            ErrorModificarProducto('Error: No se aceptan punto',<%=Id%>);
        </script>
        <%
    return;
    }
        if(arrPrecio.length >=2){
    %>
        <script>
            ErrorModificarProducto('Error:No se aceptan comas',<%=Id%>);
        </script>
        <%
    return;
    }
    if(arrPrecio2.length >=2){
    %>
        <script>
            ErrorModificarProducto('Error: No se aceptan punto',<%=Id%>);
        </script>
        <%
    return;
    }

    if(Nombre.trim().length()==0)
    {
       %>
        <script>
            ErrorModificarProducto('Error: el nombre del producto es obligatorio!',<%=Id%>);
        </script>
        <% 
        return;
    }
    if(Marca.trim().equals("0") ){
    %>
        <script>
            ErrorModificarProducto('Error: La marca del producto es obligatorio!',<%=Id%>);
        </script>
        <%  
     return;
             }
    if(Categoria.trim().equals("0") ){
    %>
        <script>
            ErrorModificarProducto('Error: La Categoria del producto es obligatorio!',<%=Id%>);
        </script>
        <%  
     return;
    } 
    if((Stock.trim().length()==0) || Integer.parseInt(Stock)<= 0 ) {
%>
        <script>
            ErrorModificarProducto('Error: El stock del producto es obligatorio y no puede ser un valor negativo o cero',<%=Id%>);
        </script>
        <%     
     return;
    }
    if(Precio.trim().length()==0 || Integer.parseInt(Precio)<= 0 ){
%>
        <script>
            ErrorModificarProducto('Error: El precio del producto es obligatorio y no puede ser un valor negativo o cero',<%=Id%>);
        </script>
        <%      
     return;
    }
    if(Descripcion.trim().length()==0 ){
    %>
        <script>
            ErrorModificarProducto('Error: La descripcion del producto es obligatorio!',<%=Id%>);
        </script>
        <% 
     return;
 }
try{
    Connection conn = ConexionBD.getConexion();
    String sql = "update inacap.producto set idMarca=?,idCategoria=?, Nombre_Producto=?, Stock=?, Precio=?, Descripcion=? where idProducto=?";
    PreparedStatement pst = conn.prepareStatement(sql);
    pst.setString(1, Marca);
    pst.setString(2, Categoria);
    pst.setString(3, Nombre);
    pst.setString(4, Stock);
    pst.setString(5, Precio);
    pst.setString(6, Descripcion);
    pst.setString(7, Id);
    pst.execute();
    response.sendRedirect("Administracion_De_Productos.jsp");
}catch(Exception e){
    out.println("Error al modificar "+e.getMessage());
}


%>