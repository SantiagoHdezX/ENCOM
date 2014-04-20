<%-- 
    Document   : ConsultaUsuario
    Created on : 10/03/2014, 02:33:48 PM
    Author     : Alumnos
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
        <title>Consulta Usuario</title>
        <script>
		$(document).ready(function(){
			   jQuery("#busqueda").show();
                jQuery("#mostrar").hide();
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
			div{
				border:1px solid rgba(128,128,128,.4);
				padding:10px;
				border-radius:5px;
				background-color:rgba(128,128,128,.1);
			}
			div.campo{
				width:500px;
			}
			div#mostrar{
				background-color:rgba(128,128,128,.05);
			}
		</style>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Consulta Usuario</li>
        </ol>
        <h1>Consulta Individual de Usuario</h1>
         <form>
			<div id="busqueda" class="campo">
                <label for="idW">Correo Trabajador</label><br />
                <input type="email" id="idW" name="idW" required>&emsp;&emsp;
                <button type="submit" class="btn btn-info" onclick="return busquedaUsuario()">Buscar Usuario</button>
            </div>
		</form>
        <div id="mostrar">
            <table class="table table-bordered" id="tabla">
                <tr>
                    <th>Correo</th>
                    <th>Password</th>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Tipo_Usuario</th>
                </tr>
            </table>
        </div>
    </body>
</html>
