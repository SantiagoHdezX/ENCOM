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
        <title>Modificar Usuario</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Caducar Evento</li>
        </ol>
        <h1>Modificar Usuario</h1>
        <div id="search">
            <form method="post">
                <label for="idW">Correo Electronico</label><br />
                <input type="email" id="idW" required /><br />
                <button type="submit" class="btn btn-primary" onclick="return busquedaUsuarioM()">Buscar Usuario</button>
            </form>
        </div>
        <div id="change">
            <form method="post">
                <label for="correo">Correo Electronico</label><br />
                <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electronico" required autofocus><br>
                <label for="passwd">Password</label><br />
                <input type="password" id="passwd" name="passwd" required><br />
                <label for="idW">Numero de Trabajador</label><br />
                <input type="number" id="idW" name="idW" placeholder="1,2,3,2552.." required><br />
                <label for="nombre">Nombre Usuario</label><br />
                <input type="text" id="nombre" name="nombre" required><br />
                <label for="direccion">Direccion</label>
                <input type="text" id="direccion" name="direccion" required><br />
                <input type="radio" name="typeusr" value="0" readonly>Profesor &nbsp;
                <input type="radio" name="typeusr" value="1" readonly>Administrador<br />
                <button type="submit" class="btn btn-success" onclick="return updateUsuario()">Actualizar Usuario</button>
            </form>
        </div>
    </body>
</html>
