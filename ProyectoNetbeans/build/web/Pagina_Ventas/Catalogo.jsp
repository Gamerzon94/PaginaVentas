<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page import="java.util.LinkedList,cl.inacap.paginaventas.base.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Catalogo - Medal of Hardware</title>
    </head>
<%
    ResultSet rs= null;
    int contador = 0;
    String busqueda = null;
    int filtro = 0;
    String sql = "";
    try{
        busqueda = request.getParameter("busqueda");
        filtro = Integer.parseInt(request.getParameter("filtro"));
    }catch(Exception e){
        busqueda = null;
    }
    try{
        Connection conn = ConexionBD.getConexion();
        if(busqueda != null && filtro == 1){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where MARCA.NOMBRE_MARCA=? order by IDPRODUCTO";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if (busqueda != null && filtro == 2){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=? order by IDPRODUCTO";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else{
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA";
            PreparedStatement pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
        }if(busqueda !=null && filtro ==3){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==4){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==5){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==6){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }
    }catch(Exception e){
        out.print("Error al cargar catalogo"+e);
    }
%>
    <body>
        <table align="center" class="trow1">
            <tr>
                <% while(rs.next()){ contador = contador+1;%>
                    <td>
                    <table>
                        <tr>
                            <td>
                                Nombre: 
                            </td>
                            <td>
                                <a href="Producto.jsp?id=<%=rs.getLong("idProducto")%>"><%=rs.getString("nombre_producto")%></a>
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
                    </table>
                </td>
                <%if(contador==3){%>
            </tr>
            <%contador=0;}}%>
        </table>
    </body>
</html>
