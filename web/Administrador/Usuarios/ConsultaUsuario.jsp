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
        <title>Consulta Usuario</title>
        <script>
            $(document).ready(function(){
                jQuery("#busqueda").show();
                jQuery("#mostrar").hide();
            })
        </script>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Consulta Usuario</li>
        </ol>
        <h1>Consulta Individual de Usuario</h1>
        <div id="busqueda">
            <form>
                <label for="idW">Correo Trabajador</label><br />
                <input type="email" id="idW" name="idW" required><br /><br />
                <button type="submit" class="btn btn-info" onclick="return busquedaUsuario()">Buscar Usuario</button>
            </form>
        </div>
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
