package org.apache.jsp.Sesiones;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class Detalle_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Detalle de la Venta - Medal of Hardware</title>\n");
      out.write("    </head>\n");

    HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") && ! hs.getAttribute("rol").equals("Vendedor"))
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    long idVenta = Long.parseLong(request.getParameter("id"));
    ResultSet rs = null, rs_aux = null;
    String sql_aux = "";
    PreparedStatement pst_aux = null;
    int aux = 0, canProd=0;
    String arrProductos[] = null, arrCantidad[] = null, arrPrecio[] = null, arrNomProduc[] = null;
    try{
        Connection conn = ConexionBD.getConexion();
        String sql_1= "SELECT * FROM VENTA WHERE IDVENTA =  ?";
        PreparedStatement pst_1 = conn.prepareStatement(sql_1);
        pst_1.setLong(2,idVenta);
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
                rs_aux = pst_1.executeQuery();
                if(rs_aux.next()){
                    arrNomProduc[i] = rs_aux.getString("NOMBRE_PRODUCTO");
                }
            }
        }
         
    }catch(Exception e){
        out.println("Error al Cargar Despacho " + e.getMessage());
    }

      out.write("\n");
      out.write("    <body>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <td>Id</td>\n");
      out.write("                <td>Cliente</td>\n");
      out.write("                <td>Vendedor</td>\n");
      out.write("                <td>Productos</td>\n");
      out.write("                <td>Precio</td>\n");
      out.write("                <td>Cantidad</td>\n");
      out.write("                <td>Total</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(idVenta);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("idUsuario") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("idVendedor"));
      out.write("</td>\n");
      out.write("                <td>");
while (aux<canProd){
                    out.print(arrNomProduc[aux]); 
                    aux = aux+1;
                }
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
