function emergente(a)
{
    alert(a);
}
function ErrorIniciarSesion(a)
{
    alert(a);
    window.location.href='../index.jsp';
}

function ErrorCrearCuenta(a)
{  
    alert(a);  
    window.location.href='../Registro/registro.jsp';
}
function ErrorModificarCuenta(a,b)
{  
    alert(a);  
    window.location.href='../Sesiones/FormularioModificar.jsp?idUsuario='+b;
}

function UsuarioCreado(a)
{
    alert(a);
    window.location.href='../index.jsp';
}

function ErrorIngresarProducto(a)
{
    alert(a);
    window.location.href='Ingreso_Productos.jsp';
}

function ErrorModificarProducto(a,b){
    
    alert(a);
    window.location.href='../Pagina_Ventas/FormularioModificarProducto.jsp?idProducto='+b;    
}

function ErrorCrearPost(a){
    
    alert(a);
    window.location.href='../Foro/NuevoTema';
}


