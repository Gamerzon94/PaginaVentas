package org.apache.jsp.Pagina_005fVentas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;

public final class Historial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Pagina_Ventas/../banner3.jsp");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"icon\" type=\"../image/png\" href=\"../img/favicon.png\" />\n");
      out.write("        <title>Historal - Medal of Hardware</title>\n");
      out.write("    </head>\n");
      out.write("        ");

            ResultSet rs = null;
            HttpSession hs = request.getSession(false);
            if(  hs == null || hs.getAttribute("rol") == null)
            {
                out.println("Error: Ud. no tiene los permisos para ingresar a esta página");
                out.println("<br /><br />");
                out.println("<a href='../index.jsp'>Volver al login</a>");
                return;
            }
            int idUsuario = Integer.parseInt(hs.getAttribute("usuario").toString());
            try{
                Connection conn = ConexionBD.getConexion();
                String sql = "SELECT VENTA.IDVENTA, VENTA.FECHAREGISTRO, VENTA.ESTADO, VENTA.TOTALVENTA FROM VENTA WHERE IDUSUARIO = ?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setLong(1, idUsuario);
                rs = pst.executeQuery();
            }catch(Exception e){
                out.println("Error al Cargar Historial " + e.getMessage());
            }
        
      out.write("\n");
      out.write("    <body>\n");
      out.write("        ");
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
      out.write("                <td WIDTH=\"150\">\n");
      out.write("                    <a href=\"../index.jsp\"><img src=\"../img/logo.png\" width=\"100%\"/></a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"../Foro/index.jsp\" class=\"button new_thread_button\"><img src=\"../img/forum-icon.png\"/>  Ir al Foro</a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
  if(  s == null || s.getAttribute("rol") == null){
      out.write("\n");
      out.write("                    <td>\n");
      out.write("                    <form action=\"../Sesiones/ValidarUsuario.jsp\">\n");
      out.write("                        RUN:\n");
      out.write("                        <input type=\"text\" name=\"run\" size=\"30\"/>\n");
      out.write("                        Clave usuario:\n");
      out.write("                        <input type=\"password\" name=\"claveUsuario\" size=\"30\" />\n");
      out.write("                        <input type=\"submit\" value=\"Ingresar al sistema\" /> <a href=\"../Registro/TerminoCondiciones.jsp\" class=\"button new_thread_button\"><img src=\"../img/iconLogin.png\"/>  Registrarse</a>       \n");
      out.write("                    </form>\n");
      out.write("                    </td>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"../Pagina_Ventas/Historial.jsp\" class=\"button new_thread_button\">Historial de Compras</a>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                    Bienvenido ");
      out.print(s.getAttribute("apellido")+", "+s.getAttribute("nombre") );
      out.write("\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")){
      out.write("\n");
      out.write("                    <a href=\"../Sesiones/AdministracionUsuarios.jsp\" class=\"button new_thread_button\">Gestion de Usuario</a>");
}
      out.write("\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Editor")){
      out.write("\n");
      out.write("                    <a href=\"Ingreso_Productos.jsp\" class=\"button new_thread_button\">Agregar Productos</a>\n");
      out.write("                    <a href=\"Administracion_De_Productos.jsp\" class=\"button new_thread_button\">Gestion de Productos</a>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    ");
if(s.getAttribute("rol").equals("Administrador")|| s.getAttribute("rol").equals("Vendedor")){
      out.write("\n");
      out.write("                    <a href=\"Despacho.jsp\" class=\"button new_thread_button\">Ventas</a>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    <a href=\"../Sesiones/CerrarSesion.jsp\" class=\"button new_thread_button\">Cerrar Sesion</a>\n");
      out.write("                    </td>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                <!--<td class=\"redesociales\">\n");
      out.write("                        <a href=\"http://www.facebook.com\"><img src=\"img/face.png\"></a>\n");
      out.write("                        <a href=\"http://www.twitter.com\"><img src=\"img/twitter.png\"></a>\n");
      out.write("                        <a href=\"http://www.youtube.com\"><img src=\"img/youtube.png\"></a>\n");
      out.write("                </td>-->\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <center><h1>Historial de sus pedidos</h1></center>\n");
      out.write("        <table width=\"1000\" hight=\"200\" border=\"1\" align=\"center\" class=\"trow1\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Pedido</td>\n");
      out.write("                <td>Fecha</td>\n");
      out.write("                <td>Estado</td>\n");
      out.write("                <td>Total</td>\n");
      out.write("                <td></td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 while(rs.next()) { 
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>#");
      out.print(rs.getString("IDVENTA"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("FECHAREGISTRO"));
      out.write("</td>\n");
      out.write("                    <td>");
 if(rs.getString("ESTADO").equals("P")){ 
      out.write("\n");
      out.write("                            Pendiente de Validacion\n");
      out.write("                            ");
} else if(rs.getString("ESTADO").equals("R")) {
      out.write("\n");
      out.write("                            Rechazado\n");
      out.write("                            ");
}else{
      out.write("\n");
      out.write("                            Aprobado\n");
      out.write("                            ");
}
      out.write("</td>\n");
      out.write("                    <td>$");
      out.print(rs.getString("TOTALVENTA"));
      out.write("</td>\n");
      out.write("                    <td><a href=\"Detalle.jsp?id=");
      out.print(rs.getLong("idVenta") );
      out.write("\">Detalles</a></td>\n");
      out.write("                </tr>\n");
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
