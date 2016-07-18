package org.apache.jsp.Pagina_005fVentas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class Despacho_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

HttpSession hs = request.getSession(false);
    if(  hs == null || hs.getAttribute("rol") == null ||
         ! hs.getAttribute("rol").equals("Administrador") && ! hs.getAttribute("rol").equals("Vendedor"))
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }
    ResultSet rs = null;
    ResultSet rs_2 = null;
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "select u.RUN,u.NOMBRE,v.PRODUCTOS,v.CANTIDAD,v.PRECIOPRO,v.TOTALVENTA,v.ESTADO from inacap.venta v join inacap.USUARIO u on v.IDUSUARIO = u.IDUSUARIO";
        PreparedStatement pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        rs.next();
        String Datos[] = rs.getString("Productos").split(",");
        for (int x=0;x<Datos.length;x++){
        String sql_2 = "select nombre_producto from Producto where idproducto = " + Datos[x];
        PreparedStatement pst_2 = conn.prepareStatement(sql_2);
        rs_2= pst.executeQuery();
        }
    }catch(Exception e){
        out.println("Error al Cargar Despacho " + e.getMessage());
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"icon\" type=\"../image/png\" href=\"../img/favicon.png\" />\n");
      out.write("        <title>Despachos</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Estado de Despachos</h1>\n");
      out.write("        \n");
      out.write("        <table width=\"1000\" hight=\"200\" border=\"1\" align=\"center\" class=\"trow1\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Rut</td>\n");
      out.write("                <td>Nombre</td>\n");
      out.write("                <td>Producto</td>\n");
      out.write("                <td>Cantidad</td>\n");
      out.write("                <td>Valor</td>\n");
      out.write("                <td>Total a Pagar</td>\n");
      out.write("                <td>Estado</td>   \n");
      out.write("            </tr>\n");
      out.write("            ");
while(rs.next()){
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(rs.getString("Run") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("Nombre") );
      out.write("</td>\n");
      out.write("                ");
if(rs_2.next()){ 
      out.write("\n");
      out.write("                    <td>");
      out.print(rs_2.getString("Productos"));
      out.write("</td>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                <td>");
      out.print(rs.getString("Cantidad"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("Preciopro"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("Totalventa") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("Estado"));
      out.write("</td>\n");
      out.write("            </tr>     \n");
      out.write("           ");
}
      out.write(" \n");
      out.write("        </table>\n");
      out.write("        \n");
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
