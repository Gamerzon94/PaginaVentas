<%
    String id = request.getParameter("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <title>Eliminar Mensaje</title>
    </head>
    <body>
        <%@include file="../banner/banner1.jsp" %>
        <center><h1>¿Esta seguro de que desea eleminar el Mensaje?</h1></center>
            <center><input type="button" value="Si" onclick = "location='eliminacionReplica.jsp?id=<%=id%>'">&nbsp;<input type="button" value="No" onclick = "location='Post.jsp?accion=1&id=<%=id%>'"></center>
    </body>
</html>
