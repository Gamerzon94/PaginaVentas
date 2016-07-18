<% /*  Segundo Avance Foro
    *  Integrantes: Matias Valdes / Adrian Gomez
    *  Taller de Programacion II Seccion I
    */
%>
<%@page import="java.util.LinkedList,cl.inacap.paginaventas.base.*"%>
<%
    HttpSession hs = request.getSession(false);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <title>Medal of Hardware</title>
        <link rel="icon" type="image/png" href="img/favicon.png" />
    </head>
    <body>
        <%@include file="banner/banner.jsp" %>
        <% if(! (hs == null || hs.getAttribute("rol") == null )) { %>
        <div class="menu">
			
                        <div class="botonmenucarro">
				<a href="Pagina_Ventas/Carro.jsp" target="iframe1">Ver Tu Carro de Compras y/o Realizar Compra</a> 
			
			</div>
                        Catalogo
			<div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp" target="iframe1">Todos los Productos</a> 
			
			</div>
			
			<div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=1&busqueda=Intel" target="iframe1">Intel</a>
			</div>
			
			<div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=1&busqueda=AMD" target="iframe1">AMD</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=2&busqueda=Procesador" target="iframe1">Procesador</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=2&busqueda=Targeta%20de%20Video" target="iframe1">Targeta de Video</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=3&busqueda=Discos%20Duros" target="iframe1">Discos Duros</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=4&busqueda=Memorias%20Ram" target="iframe1">Memorias Ram</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=5&busqueda=Placas%20Madres" target="iframe1">Placas Madres</a>
			
			</div>
                        <div class="botonmenu">
				<a href="Pagina_Ventas/Catalogo.jsp?filtro=6&busqueda=Fuentes%20de%20Poder" target="iframe1">Fuentes de Poder</a>
			
			</div>
		</div>	
		<div class="contenido">
			<iframe src="Pagina_Ventas/Catalogo.jsp" name="iframe1" width="100%" height="100%"></iframe>
		</div>
        <%}else{%>
            <center><h1>Debe Iniciar Sesión para ver el contenido.</h1></center>
        <%}%>
    </body>
</html>
