<%@page import="java.util.LinkedList,cl.inacap.paginaventas.base.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <link rel="icon" type="../image/png" href="../img/favicon.png" />
        <title>Carro de Compras - Medal of Hardware</title>
    </head>
<%
    HttpSession hs = request.getSession(false);
    int aux = 1;
    int total = 0;
    int x = 0;
%>
<%
    String accion = request.getParameter("accion");
    if(accion !=null){
        if(accion.equals("1") ){
            int pos = Integer.parseInt(request.getParameter("pos"));
            ((LinkedList<Producto>)hs.getAttribute("listaProductos")).remove(pos);
        }
    }
%>
    <body>
        <b>Carro de compras:</b> 
    <% 
        LinkedList<Producto> lp = 
             ((LinkedList<Producto>)hs.getAttribute("listaProductos"));
        if(lp==null || lp.size()==0) { aux = 0;
    %> vacío 
    <% } 
       else 
        {%><table width="1000" hight="200" align="center" class="trow1">  
            <tr>
                <td>
                    Nombre Producto
                </td>
                <td>
                    Cantidad
                </td>
                <td>
                    Precio
                </td>
                <td>
                 Eliminar   
                </td>
            </tr>
            <%
                    for(Producto p: lp) { %>
            <tr>
                    <td>
                        <%= p.getNombre() %> 
                    </td>
                    <td>
                        <%= p.getCantidad() %>
                    </td>
                    <td>
                        <%= p.getPrecio() %>
                    </td>
                    <td>
                        <a href="Carro.jsp?accion=1&pos=<%=x%>">
                        <img src="../img/eliminar.png" />
                        </a>
                    </td>
                    <%total = total+p.getPrecio()*p.getCantidad();%>
                    
            </tr>
                    <% x= x+1;}%>
            <tr>
                <td colspan="2">
                      Total          
                </td>
                <td>
                    <%=total%>
                </td>
            </tr>
        </table>    
        <%} if(aux!=0){ %>
       <input type="button" value="Realizar Venta" onclick = "location='Venta.jsp'">
       <%}%>
    </body>
</html>
