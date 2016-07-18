package org.apache.jsp.Foro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class EliminarReplica_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Foro/../banner1.jsp");
  }

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


    String id = request.getParameter("id");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Eliminar Post</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write('\n');
      out.write('\n');
 
    HttpSession s= request.getSession(false);

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div align=\"right\"><input type=\"button\" value=\"Ir al Foro\" onclick = \"location='index.jsp'\">\n");
      out.write("        ");
  if(  s == null || s.getAttribute("rol") == null){
      out.write("\n");
      out.write("                    <input type=\"button\" value=\"Registrarse\" onclick = \"location='../Registro/TerminoCondiciones.jsp'\">\n");
      out.write("                    <input type=\"button\" value=\"Iniciar Sesion\" onclick = \"location='../Sesiones/IniciarSesion.jsp'\"></td>");
}else{
      out.write("\n");
      out.write("                Bienvenido ");
      out.print(s.getAttribute("apellido")+", "+s.getAttribute("nombre") );
      out.write("<br/>\n");
      out.write("                ");
if(s.getAttribute("rol").equals("Administrador")){
      out.write("<input type=\"button\" value=\"Gestion de Usuarios\" onclick = \"location='../Sesiones/AdministracionUsuarios.jsp'\">");
}
      out.write("\n");
      out.write("                <input type=\"button\" value=\"Cerrar Sesion\" onclick = \"location='../Sesiones/CerrarSesion.jsp'\"></td>\n");
      out.write("                ");
}
      out.write("</div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <center><h1>¿Esta seguro de que desea eleminar el Mensaje?</h1></center>\n");
      out.write("            <center><input type=\"button\" value=\"Si\" onclick = \"location='eliminacionReplica.jsp?id=");
      out.print(id);
      out.write("'\">&nbsp;<input type=\"button\" value=\"No\" onclick = \"location='Post.jsp?accion=1&id=");
      out.print(id);
      out.write("'\"></center>\n");
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
