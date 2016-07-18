package org.apache.jsp.Pagina_005fVentas;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;
import java.sql.*;
import Conexion.*;
import java.util.LinkedList;
import cl.inacap.paginaventas.base.*;

public final class Catalogo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    int contador = 0;
    String busqueda = null;
    int filtro = 0;
    String sql = "";
    try{
        busqueda = request.getParameter("busqueda");
        filtro = Integer.parseInt(request.getParameter("filtro"));
    }catch(Exception e){
        busqueda = null;
    }
    try{
        Connection conn = ConexionBD.getConexion();
        if(busqueda != null && filtro == 1){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where MARCA.NOMBRE_MARCA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if (busqueda != null && filtro == 2){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else{
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA";
            PreparedStatement pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
        }if(busqueda !=null && filtro ==3){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==4){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==5){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }else if(busqueda !=null && filtro ==6){
            sql = "select PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE_PRODUCTO, PRODUCTO.STOCK,PRODUCTO.PRECIO, PRODUCTO.DESCRIPCION, PRODUCTO.IMAGEN, CATEGORIA.NOMBRE_CATEGORIA , MARCA.NOMBRE_MARCA from PRODUCTO inner join MARCA on PRODUCTO.IDMARCA = MARCA.IDMARCA inner join CATEGORIA on PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA where CATEGORIA.NOMBRE_CATEGORIA=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, busqueda);
            rs = pst.executeQuery();
        }
    }catch(Exception e){
        out.print("Error al cargar catalogo"+e);
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estilos.css\">\n");
      out.write("        <link rel=\"icon\" type=\"../image/png\" href=\"../img/favicon.png\" />\n");
      out.write("        <title>Catalogo - Medal of Hardware</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table align=\"center\" class=\"trow1\">\n");
      out.write("            <tr>\n");
      out.write("                ");
 while(rs.next()){ contador = contador+1;
      out.write("\n");
      out.write("                    <td>\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Nombre: \n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <a href=\"Producto.jsp?id=");
      out.print(rs.getLong("idProducto"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("nombre_producto"));
      out.write("</a>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Marca: \n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print(rs.getString("nombre_marca"));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Categoria: \n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print(rs.getString("NOMBRE_CATEGORIA"));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Stock: \n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print(rs.getString("stock"));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                Precio: \n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print(rs.getString("precio"));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\">\n");
      out.write("                                <img src=\"");
      out.print(rs.getString("imagen"));
      out.write("\" width=\"200\" height=\"200\"/>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                </td>\n");
      out.write("                ");
if(contador==3){
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");
contador=0;}}
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
