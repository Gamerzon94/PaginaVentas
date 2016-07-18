package org.apache.jsp.Pagina_005fVentas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;
import java.util.LinkedList;
import cl.inacap.paginaventas.base.*;

public final class Producto_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');

    ResultSet rs= null;
    ResultSet rs_pos= null;
    String acc = request.getParameter("accion");
    int cantidad = 0;
    try{
    cantidad = Integer.parseInt(request.getParameter("cantidad"));
    }catch(Exception e){
        cantidad = 0;
    }
    int id = Integer.parseInt(request.getParameter("id"));
    try{
        Connection conn = ConexionBD.getConexion();
        String sql = "select * from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where PRODUCTO.IDPRODUCTO = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, id);
        rs = pst.executeQuery();
        rs.next();
    }catch(Exception e){
        out.print("Error al cargar producto"+e);
    }
    if(acc != null)
    {
        if(acc.equals("1"))
        {
            try{
                Connection conn = ConexionBD.getConexion();
                String sql_pos = "SELECT * FROM PRODUCTO WHERE IDPRODUCTO = ?";
                PreparedStatement pst_pos = conn.prepareStatement(sql_pos);
                pst_pos.setLong(1, id);
                rs_pos = pst_pos.executeQuery();
                rs_pos.next();
                Producto p = new Producto(rs.getInt("idProducto"),rs.getInt("precio"), cantidad);
                HttpSession hs = request.getSession(false);
                ((LinkedList<Producto>)hs.getAttribute("listaProductos")).add(p);   
            }catch(Exception e){
                out.println("Error al agregar producto al carrito de compras "+e);
            }       
        }
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <title>");
      out.print(rs.getString("NOMBRE_PRODUCTO"));
      out.write(" - Medal of Hardware</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table align=\"center\" class=\"trow1\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Nombre: \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("nombre_producto"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Marca: \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("nombre_marca"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Categoria: \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("NOMBRE_CATEGORIA"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Stock: \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("stock"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Precio: \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("precio"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td colspan=\"2\">\n");
      out.write("                    <img src=\"");
      out.print(rs.getString("imagen"));
      out.write("\" width=\"200\" height=\"200\"/>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Descripcion:\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(rs.getString("Descripcion"));
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <input type=\"text\" name=\"cantidad\" size=\"30\" value=\"1\" />\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                <input type=\"button\" value=\"Agregar al Carro de Compra\" onclick = \"location='Producto.jsp?accion=1&id=");
      out.print(rs.getString("idProducto"));
      out.write("&cantidad='cantidad\">\n");
      out.write("                </td>\n");
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
