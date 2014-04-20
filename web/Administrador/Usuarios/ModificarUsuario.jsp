<%-- 
    Document   : ModificarUsuario
    Created on : 19/03/2014, 10:54:31 AM
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
		<script src="../../js/usuarios.js"></script>
		<script src="../../js/jquery.color-2.1.2.js"></script>
        <script>
            $(document).ready(function(){
               $("#search").show();
               $("#change").hide();
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
			div.campog{
				border:1px solid rgba(128,128,128,.4);
				padding:10px;
				width:525px;
				border-radius:10px;
				background-color:rgba(128,128,128,.03);
			}
		</style>
        <title>Modificar Usuario</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Modificar Usuario</li>
        </ol>
		
        <h1>Modificar Usuario</h1>
        <form method="post">
			<div id="search" class="campo">
                <label for="idWT">Correo Electronico</label><br />
                <input type="email" id="idWT" required />&emsp;&emsp;
                <button type="submit" class="btn btn-warning" id="btn" onclick="return busquedaUsuarioM()">Buscar Usuario</button>
            </div>
		</form>
		<br>
        <div id="change" class="campog">
            <form method="post">
				<div class="campo">
                <label for="correo">Correo Electronico</label><br>
                <input type="email" id="correo" name="correo" placeholder="ejemplo@xxx.com" readonly>
			</div>
			<br>
			<div class="campo" id="passwddiv" i=1>
				<label for="passwd">Password</label><br>
                <input type="password" id="passwd" name="passwd" />
			</div>
			<br>
				<div class="campo">
					<label for="cpasswd"> Confirmar Password</label><br>
					<input type="password" id="cpasswd" name="cpasswd">
				</div>
			<br>
			<div class="campo" id="numdiv" i=1>
                <label for="idW">Numero de Trabajador</label><br>
                <input type="number" id="idW" name="idW">
			</div>
			<br>
			<div class="campo">
                <label for="nombre">Nombre Usuario</label><br>
                <input type="text" id="nombre" name="nombre" readonly>
			</div>
			<br>
			<div class="campo" id="dirdiv" i=1>
                <label for="direccion">Direccion</label><br>
                <input type="text" id="direccion" name="direccion" size="30">
			</div>
			<br>
            <div class="campo">
				<label for="permisos">Permisos</label><br>
				<input type="text" id="typeusr" readonly size="25">
			</div>
			<br>
                <button type="submit" class="btn btn-success" onclick="return updateUser()">Actualizar Usuario</button>
            </form>
        </div>
    </body>
</html>
