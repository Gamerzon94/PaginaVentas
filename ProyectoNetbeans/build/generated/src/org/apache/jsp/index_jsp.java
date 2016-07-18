package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.LinkedList;
import cl.inacap.paginaventas.base.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

 /*  Segundo Avance Foro
    *  Integrantes: Matias Valdes / Adrian Gomez
    *  Taller de Programacion II Seccion I
    */

      out.write('\n');
      out.write('\n');

    HttpSession hs = request.getSession(false);

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilos.css\">\n");
      out.write("        <title>Medal of Hardware</title>\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"img/favicon.png\" />\n");
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
      out.write("        <center><a href=\"index.jsp\"><img src=\"img/logo.png\" width=\"10%\"/></a></center>\n");
      out.write("        <div id=\"navbar\">\n");
      out.write("            <span class=\"inbar\">\n");
      out.write("                <ul>\n");
      out.write("                    <li class=\"navhome\"><a href=\"index.jsp\"><span>Tienda</span></a></li>\n");
      out.write("                    <li><a href=\"Foro/index.jsp\"><span>Foro</span></a></li>\n");
      out.write("                    <li><a href=\"Informacion/VisionYMision.jsp\"><span>Quienes Somos</span></a></li>\n");
      out.write("                    ");
  if(  s == null || s.getAttribute("rol") == null){
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <form action=\"../Sesiones/ValidarUsuario.jsp\">\n");
      out.write("                        RUN:\n");
      out.write("                        <input type=\"text\" name=\"run\" size=\"30\"/>\n");
      out.write("                        Clave usuario:\n");
      out.write("                        <input type=\"password\" name=\"claveUsuario\" size=\"30\" />\n");
      out.write("                        <input type=\"submit\" value=\"Ingresar al sistema\" /> <a href=\"../Registro/TerminoCondiciones.jsp\" class=\"button new_thread_button\"><img src=\"../img/iconLogin.png\"/>  Registrarse</a>       \n");
      out.write("                    </form>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </span>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <div class=\"menu\">\n");
      out.write("\t\t\tCatalogo\n");
      out.write("                        <div class=\"botonmenucarro\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Carro.jsp\" target=\"iframe1\">Ver Tu Carro de Compras y/o Realizar Compra</a> \n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp\" target=\"iframe1\">Todos los Productos</a> \n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=1&busqueda=Intel\" target=\"iframe1\">Intel</a>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=1&busqueda=AMD\" target=\"iframe1\">AMD</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=2&busqueda=Procesador\" target=\"iframe1\">Procesador</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=2&busqueda=Targeta%20de%20Video\" target=\"iframe1\">Targeta de Video</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=3&busqueda=Discos%20Duros\" target=\"iframe1\">Discos Duros</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=4&busqueda=Memorias%20Ram\" target=\"iframe1\">Memorias Ram</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=5&busqueda=Placas%20Madres\" target=\"iframe1\">Placas Madres</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div class=\"botonmenu\">\n");
      out.write("\t\t\t\t<a href=\"Pagina_Ventas/Catalogo.jsp?filtro=6&busqueda=Fuentes%20de%20Poder\" target=\"iframe1\">Fuentes de Poder</a>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\t\n");
      out.write("\t\t<div class=\"contenido\">\n");
      out.write("\t\t\t<iframe src=\"Pagina_Ventas/Catalogo.jsp\" name=\"iframe1\" width=\"100%\" height=\"100%\"></iframe>\n");
      out.write("\t\t</div>\n");
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
