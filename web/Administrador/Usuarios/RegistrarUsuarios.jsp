<%-- 
    Document   : RegistrarUsuarios
    Created on : 10/03/2014, 02:06:16 PM
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
		<script src="../../js/jquery.color-2.1.2.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
		<script src="../../js/usuarios.js"></script>
		<style>
			div.campo{
				border:1px solid rgba(128,128,128,.4);
				padding:10px;
				width:500px;
				border-radius:5px;
				background-color:rgba(128,128,128,.1);
			}
		</style>
        <title>Registro Usuarios</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Registro Usuario</li>
        </ol>
        <h1>Registrar Usuario</h1>
        <form method="post" name="RegisUs">
		
			<div class="campo" id="correodiv" i=1>
                <label for="correo">Correo Electronico</label><br>
                <input type="email" id="correo" name="correo" placeholder="ejemplo@xxx.com">
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
			<div class="campo" id="nomdiv" i=1>
                <label for="nombre">Nombre Usuario</label><br>
                <input type="text" id="nombre" name="nombre">
			</div>
			<br>
			<div class="campo" id="dirdiv" i=1>
                <label for="direccion">Direccion</label><br>
                <input type="text" id="direccion" name="direccion" size="30">
			</div>
			<br>
			<div class="campo">	
                <input type="radio" name="typeusr" value="0" checked>Profesor &nbsp;
                <input type="radio" name="typeusr" value="1">Administrador<br />
			</div>
			<br>
                <button type="submit" class="btn btn-success" onclick="return registrarUsuario()">Registrar Usuario</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </form>
    </body>
</html>
