package org.apache.jsp.Mensajeria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class Mensajes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <link rel=\"icon\" type=\"../image/png\" href=\"../img/favicon.png\" />\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Mensajes para el administrador</title>\n");
      out.write("    </head>\n");
      out.write("    ");

        ResultSet rs = null;
        HttpSession hs = request.getSession(false);
        if(  hs == null || hs.getAttribute("rol") == null || (! hs.getAttribute("cargo").equals("Administrador"))){
            out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
            out.println("<br /><br />");
            out.println("<a href='../index.jsp'>Volver al login</a>");
            return;
        }
        try{
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from MENSAJE";
            PreparedStatement pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
        }catch(Exception ex){
             out.println("Error al Cargar mensajes " + ex.getMessage());
        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <table width=\"1000\" hight=\"200\" border=\"1\" align=\"center\" class=\"trow1\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Id</td>\n");
      out.write("                <td>Nombre</td>\n");
      out.write("                <td>Telefono</td>\n");
      out.write("                <td>Email</td>\n");
      out.write("                <td>Fecha</td>\n");
      out.write("                <td>Operaciones</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
while(rs.next()){
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(rs.getString("idMensaje") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("nombre") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("telefono") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("email") );
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("fechaRegistro") );
      out.write("</td>\n");
      out.write("                <td></td>\n");
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
