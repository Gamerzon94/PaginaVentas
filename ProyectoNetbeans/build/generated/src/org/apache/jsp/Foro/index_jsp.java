package org.apache.jsp.Foro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    ResultSet rs= null;
    try{
        Connection conn = ConexionBD.getConexion();
        String sql ="select post.IDPOST,post.TITULO, usuario.NOMBRE, post.FECHAREGISTRO from POST inner join USUARIO on IDAUTOR = IDUSUARIO order by IDPOST";
        PreparedStatement pst = conn.prepareStatement(sql); 
        rs = pst.executeQuery();
    }catch(Exception e){
        out.print("Excepción de SQL: " + e);
        return;
    }


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Bienvenido Foro</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <input type=\"button\" value=\"Publicar Tema\" onclick = \"location='NuevoTema.jsp'\">\n");
      out.write("        <table width=\"1000\" hight=\"200\" border=\"1\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Titulo</td>\n");
      out.write("                <td>Autor</td>\n");
      out.write("                <td>Fecha Publicacion</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
while(rs.next()) {
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td><a href=\"Post.jsp?accion=1&id=");
      out.print(rs.getLong("idPost"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("titulo"));
      out.write("</a></td>\n");
      out.write("                <td>");
      out.print(rs.getString("nombre"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getDate("fecharegistro"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 } 
      out.write("\n");
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
