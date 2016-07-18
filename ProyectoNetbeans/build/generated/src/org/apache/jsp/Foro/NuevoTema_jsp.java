package org.apache.jsp.Foro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class NuevoTema_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Foro/../banner/banner1.jsp");
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

      out.write('\n');

    HttpSession hs = request.getSession(false); 
    if(  hs == null || hs.getAttribute("rol") == null )
    {
        out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
        out.println("<br /><br />");
        out.println("<a href='../index.jsp'>Volver al login</a>");
        return;
    }   
    long usuario = Long.parseLong(hs.getAttribute("usuario").toString());



      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Crear nuevo tema</title>\n");
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
      out.write("        <center><a href=\"../index.jsp\"><img src=\"../img/logo.png\" width=\"10%\"/></a></center>\n");
      out.write("        <div id=\"navbar\">\n");
      out.write("            <span class=\"inbar\">\n");
      out.write("                <ul>\n");
      out.write("                    ");
 if(! (s == null || s.getAttribute("rol") == null )) { 
      out.write("\n");
      out.write("                    <li>Bienvenido ");
      out.print(s.getAttribute("apellido")+", "+s.getAttribute("nombre") );
      out.write(" &nbsp;</li>\n");
      out.write("                    <li><a href=\"../index.jsp\"><span>Tienda</span></a></li>\n");
      out.write("                    <li class=\"navhome\"><a href=\"index.jsp\"><span><img src=\"../img/forum-icon.png\"/>&nbsp;Foro</span></a></li>\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")){
      out.write("\n");
      out.write("                    <li><a href=\"../Sesiones/AdministracionUsuarios.jsp\"><span>Gestion de Usuario</span></a></li>");
}
      out.write("\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Editor")){
      out.write("\n");
      out.write("                    <li><a href=\"../Pagina_Ventas/Ingreso_Productos.jsp\"><span>Agregar Productos</span></a></li>\n");
      out.write("                    <li><a href=\"../Pagina_Ventas/Administracion_De_Productos.jsp\"><span>Gestion de Productos</span></a></li>");
}
      out.write("\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Vendedor")){
      out.write("\n");
      out.write("                    <li><a href=\"../Pagina_Ventas/Despacho.jsp\"><span>Ventas</span></a></li>");
}
      out.write("\n");
      out.write("                    <li><a href=\"../Pagina_Ventas/Historial.jsp\"><span>Sus Pedidos</span></a></li>\n");
      out.write("                    <li><a href=\"../Sesiones/CerrarSesion.jsp\"><span>Cerrar Sesion</span></a></li>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    <li><form action=\"../Sesiones/ValidarUsuario.jsp\">\n");
      out.write("                        &nbsp;RUN:\n");
      out.write("                        <input type=\"text\" name=\"run\" size=\"30\"/>\n");
      out.write("                        Clave usuario:\n");
      out.write("                        <input type=\"password\" name=\"claveUsuario\" size=\"30\" />\n");
      out.write("                        <input type=\"submit\" value=\"Iniciar Sesión\" />     \n");
      out.write("                    </form></li>\n");
      out.write("                    <li><a href=\"../Registro/TerminoCondiciones.jsp\"><span><img src=\"../img/iconLogin.png\"/> &nbsp;Registrarse</span></a></li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    <li><a href=\"../Informacion/VisionYMision.jsp\"><span>Quienes Somos</span></a></li>\n");
      out.write("                </ul>\n");
      out.write("            </span>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("        <table>\n");
      out.write("            <form action=\"guardarTema.jsp\" method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"id\" value=\"");
      out.print(usuario);
      out.write("\"/>\n");
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
      out.write("                    <td><input type=\"submit\" value=\"Publicar Tema\"  /></td>\n");
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
