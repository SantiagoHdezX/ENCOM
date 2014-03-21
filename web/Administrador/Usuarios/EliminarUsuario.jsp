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
            <label for="nombre">Correo Electronico del Usuario</label><br />
            <input type="email" name="idW" id="idW" placeholder="Ingresa el correo electronico" required><br /><br />
            <button type="submit" class="btn btn-danger" onclick="return EliminarUsuario()">Eliminar</button>
        </form>
    </body>
</html>
