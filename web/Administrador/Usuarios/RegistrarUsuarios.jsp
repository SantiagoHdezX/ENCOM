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
        <script src="../../js/bootstrap.min.js"></script>
        <title>Registro Usuarios</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Registro Usuario</li>
        </ol>
        <h1>Registrar Usuario</h1>
        <form method="post">
                <label for="correo">Correo Electronico</label><br />
                <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electronico" required autofocus><br>
                <label for="passwd">Password</label><br />
                <input type="password" id="passwd" name="passwd" required><br />
                <label for="idW">Numero de Trabajador</label><br />
                <input type="number" id="idW" name="idW" required><br />
                <label for="nombre">Nombre Usuario</label><br />
                <input type="text" id="nombre" name="nombre" required><br />
                <label for="direccion">Direccion</label>
                <input type="text" id="direccion" name="direccion" required><br />
                <input type="radio" name="typeusr" value="0">Profesor &nbsp;
                <input type="radio" name="typeusr" value="1">Administrador<br />
                <button type="submit" class="btn btn-success" onclick="return registrarUsuario()">Registrar Usuario</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </form>
    </body>
</html>
