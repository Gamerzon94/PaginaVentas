<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page import="java.util.LinkedList,cl.inacap.paginaventas.base.*"%>
<%
    ResultSet rs= null;
    ResultSet rs_pos= null;
    String acc = request.getParameter("accion");
    boolean guardado = false;
    int cantidad = 0;
    int Stock = 1;
    HttpSession hs = request.getSession(false);
    try{
    cantidad = Integer.parseInt(request.getParameter("cantidad"));
    }catch(Exception e){
        cantidad = 0;
    }
    int id = Integer.parseInt(request.getParameter("id"));
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "select * from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where PRODUCTO.IDPRODUCTO = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, id);
        rs = pst.executeQuery();
        rs.next();
    }catch(Exception e){
        out.print("Error al cargar producto"+e);
    }
    if(acc != null)
    {
        if(acc.equals("1"))
        {
            if(hs == null || hs.getAttribute("rol") == null){
            }
                if(cantidad > rs.getLong("Stock") ){
                    if(rs.getLong("Stock")==0){
                        Stock=0;
                    } 
                    Stock=0;
                }else if (cantidad<=0){
                        Stock=0;
                }else{
            try{
                Connection conn = ConexionBD.getConexion();
                String sql_pos = "SELECT * FROM PRODUCTO WHERE IDPRODUCTO = ?";
                PreparedStatement pst_pos = conn.prepareStatement(sql_pos);
                pst_pos.setLong(1, id);
                rs_pos = pst_pos.executeQuery();
                rs_pos.next();
                Producto p = new Producto(id,rs.getString("Nombre_producto"),rs.getInt("precio"), cantidad);
                ((LinkedList<Producto>)hs.getAttribute("listaProductos")).add(p);   
                guardado = true;
            }catch(Exception e){
                out.println("Error al agregar producto al carrito de compras "+e);
            }
                }
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title><%=rs.getString("NOMBRE_PRODUCTO")%> - Medal of Hardware</title>
    </head>
    <body>
        <form action="Producto.jsp" method="post">
            <table align="center" class="trow1">
                <tr>
                    <td>
                        Nombre: 
                    </td>
                    <td>
                        <%=rs.getString("nombre_producto")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Marca: 
                    </td>
                    <td>
                        <%=rs.getString("nombre_marca")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Categoria: 
                    </td>
                    <td>
                        <%=rs.getString("NOMBRE_CATEGORIA")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Stock: 
                    </td>
                    <td>
                        <%if(Integer.parseInt(rs.getString("stock"))<0){%>
                            0
                        <%}else{%>
                            <%=rs.getString("stock")%>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio: 
                    </td>
                    <td>
                        $<%=rs.getString("precio")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img src="<%=rs.getString("imagen")%>" width="200" height="200"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Descripcion:
                    </td>
                    <td>
                        <%=rs.getString("Descripcion")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="accion" value="1"/>
                        <input type="hidden" name="id" value="<%=rs.getString("idProducto")%>" />
                        <%if(guardado == true){%>
                            <font color="red">Producto Agregado con Exito al Carro de compras</font>
                        <%}%>
                        <%  
                            if(  hs == null || hs.getAttribute("rol") == null )
                            {
                               %>Debe iniciar sesion para poder agregar productos al carro de compras.<%
                            } else{  %>
                        Cantidad: <br/>
                        <input type="text" name="cantidad" size="5" value="1"/>
                        <%}%>
                    </td>
                    <td>
                        <br/>
                        <%if(guardado == true){%>
                            <br/>
                        <%}  
                            if(  hs == null || hs.getAttribute("rol") == null )
                            {     
                            } else{  %>
                        <input type="submit" value="Agregar al Carro de Compras"  />
                       <%}
                        if(Stock==0 ){
                            %> Error: Stock insuficiente  <%
                        }
                       %>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
