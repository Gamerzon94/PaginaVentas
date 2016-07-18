<%@page import="java.sql.*,javax.servlet.http.HttpSession,Conexion.ConexionBD,java.util.LinkedList" %>
<%@page import="cl.inacap.paginaventas.base.*" %>
<script src="../JS/JS.js" type="text/javascript"></script>
<%
   
    String run   = request.getParameter("run");
    String clave = request.getParameter("claveUsuario");
    
    
    HttpSession hs = request.getSession(true);  
                                                
    try
    {
        Connection conn = ConexionBD.getConexion();
        Statement st    = conn.createStatement();
             
        String sql      = "select * from inacap.Usuario where " +
                          "run='" + run + "' and contrasena='" + clave + "'";
        ResultSet rs    = st.executeQuery(sql);
        if(rs.next()){
        
            if( rs.getString("estaActivo").equals("s"))
            {
                hs.setAttribute( "run", rs.getString("run") );
                hs.setAttribute( "cargo", rs.getLong("idCargo") );
                hs.setAttribute( "usuario", rs.getString("idUsuario") );
                hs.setAttribute( "nombre", rs.getString("nombre") );
                hs.setAttribute( "apellido", rs.getString("apellido") );
                hs.setAttribute("listaProductos", new LinkedList<Producto>());
                String sql2 = "select * from inacap.cargo";
                ResultSet rs2    = st.executeQuery(sql2);
                while (rs2.next()){
                    if( hs.getAttribute("cargo").equals(rs2.getLong("idCargo")) ){
                        hs.setAttribute( "rol", rs2.getString("nomCargo") );
                        response.sendRedirect(rs2.getString("redireccion"));
                    }
                }
            }else if (rs.getString("estaActivo").equals("n")){
                
                %>
                <script>
                    ErrorIniciarSesion('Error: su cuenta esta desactivada');
                </script>
                    <%
            }
            else
            {
                %>
                <script>
                    ErrorIniciarSesion('Error: usuario o clave erróneos');
                </script>
                <%
            }   
        }else{
            %>
                <script>
                    ErrorIniciarSesion('Error: usuario o clave erróneos');
                </script>
                <%
        }
    }    
    catch(SQLException e)
    {
        out.println("Excepción de SQL: " + e);
    }
%>
