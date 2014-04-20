<%-- 
    Document   : EliminarUsuario
    Created on : 20/03/2014, 11:40:21 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="../../js/jquery-1.11.0.min.js"></script>
        <script src="../../js/client.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
		<script src="../../js/jquery.color-2.1.2.js"></script>
		<script>
		$(document).ready(function(){
			$("input").focus(function(){
					$(this).parent().css({
						"border":"1px solid rgba(0,0,255,.4)",
						"background-color":"rgba(0,0,255,.3)"});
				  });
			$("#idW").blur(function(){
					var x=$(this).val();
					var atpos=x.indexOf("@");
					var dotpos=x.lastIndexOf(".");
					if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
					{
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow");
					}
					else{
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow");
					}
				});
			});
		</script>
		<style>
			div.campo{
				border:1px solid rgba(128,128,128,.4);
				padding:10px;
				width:500px;
				border-radius:5px;
				background-color:rgba(128,128,128,.1);
			}
		</style>
        <title>Eliminar Usuario</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Eliminar Usuario</li>
        </ol>
        <h1>Eliminar Usuario</h1>
        <form method="post">
		<div class="campo">
            <label for="nombre">Correo Electronico del Usuario</label><br />
            <input type="email" name="idW" id="idW" placeholder="Ingresa el correo electronico" required>&emsp;&emsp;
            <button type="submit" class="btn btn-danger" onclick="return EliminarUsuario()">Eliminar</button>
		</div></form>
    </body>
</html>
