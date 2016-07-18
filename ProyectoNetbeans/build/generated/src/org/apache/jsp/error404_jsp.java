package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class error404_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/banner.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilos.css\">\n");
      out.write("        <title>Error 404</title>\n");
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
      out.write("    <body >\n");
      out.write("        \n");
      out.write("        <table class=\"barraNegra\">\n");
      out.write("            <tr>\n");
      out.write("                <td class=\"redesociales\">\n");
      out.write("                        <a href=\"http://www.facebook.com\"><img src=\"img/face.png\"></a>\n");
      out.write("                        <a href=\"http://www.twitter.com\"><img src=\"img/twitter.png\"></a>\n");
      out.write("                        <a href=\"http://www.youtube.com\"><img src=\"img/youtube.png\"></a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"Foro/index.jsp\" class=\"button new_thread_button\"><span><img src=\"img/forum-icon.png\"/>  Ir al Foro</span></a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
  if(  s == null || s.getAttribute("rol") == null){
      out.write("\n");
      out.write("                    <form action=\"Sesiones/ValidarUsuario.jsp\">\n");
      out.write("                        RUN:\n");
      out.write("                        <input type=\"text\" name=\"run\" size=\"30\"/>\n");
      out.write("                        Clave usuario:\n");
      out.write("                        <input type=\"password\" name=\"claveUsuario\" size=\"30\" />\n");
      out.write("                        <input type=\"submit\" value=\"Ingresar al sistema\" /> o <a href=\"Registro/TerminoCondiciones.jsp\" class=\"button new_thread_button\"><span><img src=\"img/iconLogin.png\"/>  Registrarse</span></a>       \n");
      out.write("                    </form>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    Bienvenido ");
      out.print(s.getAttribute("apellido")+", "+s.getAttribute("nombre") );
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")){
      out.write("\n");
      out.write("                    <input type=\"button\" value=\"Gestion de Usuarios\" onclick = \"location='Sesiones/AdministracionUsuarios.jsp'\"></td><td>");
}
      out.write("\n");
      out.write("                    <input type=\"button\" value=\"Cerrar Sesion\" onclick = \"location='Sesiones/CerrarSesion.jsp'\">\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <center>\n");
      out.write("            <h2>Cuatro,<br /> oh: cuatro.</h2>\n");
      out.write("            <h3>No se encontró la página</h3>\n");
      out.write("            <p>Había una <br /><strong>PÁGINA</strong><br /> en este sitio.<br />Ya no está.<br /><br /><em>(¿Es esto lo que ocurre con las páginas que se internan en el bosque?)</em></p>\n");
      out.write("        </center>\n");
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
