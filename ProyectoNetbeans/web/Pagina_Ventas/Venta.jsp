<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page import="java.util.LinkedList,cl.inacap.paginaventas.base.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Venta - Medal of Hardware</title>
    </head>
<%
    HttpSession hs = request.getSession(false); 
    String Produc ="";
    String Cant = "";
    String PrecioPro = "";
    String sql_aux = "";
    PreparedStatement pst_aux = null;
    ResultSet rs_aux= null;
    int total = 0;
    int idUsu = Integer.parseInt(hs.getAttribute("usuario").toString());
    LinkedList<Producto> lp = ((LinkedList<Producto>)hs.getAttribute("listaProductos"));
    if(lp==null || lp.size()==0) {
        response.sendRedirect("../index.jsp");
    } 
    else 
    {
        for(Producto p: lp) { 
            try{
                Connection conn = ConexionBD.getConexion();
                sql_aux = "select * from producto where idProducto  = ?";
                pst_aux = conn.prepareStatement(sql_aux);
                pst_aux.setLong(1, p.getId());
                rs_aux = pst_aux.executeQuery();
                rs_aux.next();
                sql_aux = "UPDATE PRODUCTO SET STOCK = ? WHERE IDPRODUCTO = ?";
                pst_aux = conn.prepareStatement(sql_aux);
                pst_aux.setLong(1, rs_aux.getLong("Stock")-p.getCantidad());
                pst_aux.setLong(2, p.getId());
                pst_aux.execute();
                rs_aux= null;
                
            }catch(Exception e){
                out.println("Error en actualizar productos");
            }
            Produc = Produc+String.valueOf(p.getId())+",";
            Cant = Cant+String.valueOf(p.getCantidad())+",";
            PrecioPro = PrecioPro+String.valueOf(p.getPrecio())+",";
            total = total+p.getPrecio()*p.getCantidad();
        }
    }
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "insert into VENTA(IDUSUARIO, PRODUCTOS, CANTIDAD,PRECIOPRO,TOTALVENTA, ESTADO, IDVENDEDOR) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, idUsu);
        pst.setString(2, Produc);
        pst.setString(3, Cant);
        pst.setString(4, PrecioPro);
        pst.setLong(5, total);
        pst.setString(6, "P");
        pst.setLong(7, 5);
        pst.execute();
        hs.setAttribute("listaProductos", new LinkedList<Producto>());
    }catch(Exception e){
        out.println("Error al guardar en la BD!"+e);
    }
%>
    <body>
        <center><h1>Venta Exitosa, Espere a que nuestro vendedor pase a despachado su pedido.</h1></center>
    </body>
</html>
