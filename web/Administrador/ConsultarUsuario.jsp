<%-- 
    Document   : ConsultarUsuario
    Created on : 19/03/2014, 09:23:39 AM
    Author     : Alumnos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Usuarios</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script>
            $(document).ready(function(){
               obtenerUsuarios(); 
            });
        </script>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="index.jsp">Menu Administrador</a></li>
            <li class="active">Consulta Usuario</li>
        </ol>
        <table class="table table-striped" id="tabla">
            <tr>
                <th>Nombre</th>
                <th>ID</th>
                <th>Correo Electronico</th>
                <th>Direccion</th>
            </tr>
        </table>
    </body>
</html>
