package org.apache.jsp.Mensajeria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NuevoMensaje_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html\" charset=\"UTF-8\">\n");
      out.write("        <title>Crear nuevo mensaje</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        En caso de no tener una cuenta y necesitar contacto con un administrador, favor dejanos tu mensaje con los datos que se indican a continuacion.\n");
      out.write("        <table>\n");
      out.write("            <form action=\"guardarMensaje.jsp\" method=\"post\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Nombre: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"Nombre\" size=\"49\"  /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Telefono: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"Telefono\" size=\"49\"  /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"Email\" size=\"49\"  /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Titulo: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"titulo\" size=\"49\"  /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Tu Mensaje: </td>\n");
      out.write("                    <td><textarea rows=\"10\" cols=\"50\" name=\"mensaje\"></textarea></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td><input type=\"submit\" value=\"Enviar mensaje\"  /></td>\n");
      out.write("                </tr>\n");
      out.write("            </form>\n");
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
