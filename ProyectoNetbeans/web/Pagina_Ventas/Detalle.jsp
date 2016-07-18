<%@page import="javax.servlet.http.HttpSession,java.sql.* ,Conexion.* " %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de la Venta - Medal of Hardware</title>
    </head>
<%
    HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null )
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    int accion = 0;
    try{
        accion = Integer.parseInt(request.getParameter("accion"));
    }catch(Exception ex){
        accion = 0;
    }
    long idVenta = Long.parseLong(request.getParameter("id"));
    ResultSet rs = null, rs_aux = null;
    String sql_aux = "", nombreCliente = "", nombreVendedor = "", runCliente = "";
    PreparedStatement pst_aux = null;
    int aux = 0, canProd=0;
    String arrProductos[] = null, arrCantidad[] = null, arrPrecio[] = null, arrNomProduc[] = null;
    try{
        Connection conn = ConexionBD.getConexion();
        String sql_1= "SELECT * FROM VENTA WHERE IDVENTA =  ?";
        PreparedStatement pst_1 = conn.prepareStatement(sql_1);
        pst_1.setLong(1,idVenta);
        rs = pst_1.executeQuery();
        if(rs.next()){
            arrProductos = rs.getString("PRODUCTOS").split(",");
            arrCantidad = rs.getString("CANTIDAD").split(",");
            arrPrecio = rs.getString("PRECIOPRO").split(",");
            canProd = arrProductos.length;
            arrNomProduc = new String [canProd];
            for (int i = 0; i<canProd; i++){
                conn = ConexionBD.getConexion();
                sql_aux = "SELECT * FROM PRODUCTO WHERE IDPRODUCTO = ?";
                pst_aux = conn.prepareStatement(sql_aux);
                pst_aux.setLong(1,Integer.parseInt(arrProductos[i]));
                rs_aux = pst_aux.executeQuery();
                if(rs_aux.next()){
                    arrNomProduc[i] = rs_aux.getString("Nombre_producto");
                }
            }
            conn = ConexionBD.getConexion();
            sql_aux = "SELECT USUARIO.APELLIDO, USUARIO.NOMBRE, USUARIO.RUN FROM USUARIO WHERE IDUSUARIO = ?";
            pst_aux = conn.prepareStatement(sql_aux);
            pst_aux.setLong(1,Integer.parseInt(rs.getString("idUsuario")));
            rs_aux = pst_aux.executeQuery();
            if(rs_aux.next()){
                nombreCliente = rs_aux.getString("APELLIDO")+", "+rs_aux.getString("NOMBRE");
                runCliente = rs_aux.getString("RUN");
            }
            conn = ConexionBD.getConexion();
            sql_aux = "SELECT USUARIO.APELLIDO, USUARIO.NOMBRE, USUARIO.RUN FROM USUARIO WHERE IDUSUARIO = ?";
            pst_aux = conn.prepareStatement(sql_aux);
            pst_aux.setLong(1,Integer.parseInt(rs.getString("idVendedor")));
            rs_aux = pst_aux.executeQuery();
            if(rs_aux.next()){
                nombreVendedor = rs_aux.getString("apellido")+", "+rs_aux.getString("Nombre");
            }
        }
         
    }catch(Exception e){
        out.println("Error al Cargar Detalle " + e.getMessage());
    }
%>
    <body>
        <%if(accion == 1){%>
            <%@include file="../banner/banner4.jsp" %>
        <%}else{%>
            <%@include file="../banner/banner5.jsp" %>
        <%}%>
        <table width="1000" hight="200" align="center" class="trow1">
            <tr>
                <td>Pedido</td>
                <td>Cliente</td>
                <td>Run Cliente</td>
                <td>Vendedor</td>
                <td>Productos</td>
                <td>Precio</td>
                <td>Cantidad</td>
                <td>Total</td>
            </tr>
            <tr>
                <td><%=idVenta%></td>
                <td><%=nombreCliente %></td>
                <td><%=runCliente %></td>
                <td><%=nombreVendedor %></td>
                <td><%while (aux<canProd){
                    out.print(arrNomProduc[aux]+"<br/>"); 
                    aux = aux+1;
                } aux =0;%></td>
                <td><%while (aux<canProd){
                    out.print("$"+arrPrecio[aux]+"<br/>"); 
                    aux = aux+1;
                } aux =0;%></td>
                <td><%while (aux<canProd){
                    out.print(arrCantidad[aux]+"<br/>"); 
                    aux = aux+1;
                } aux =0;%></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>$<%=rs.getString("totalVenta") %></td>
            </tr>
        </table>
    </body>
</html>
