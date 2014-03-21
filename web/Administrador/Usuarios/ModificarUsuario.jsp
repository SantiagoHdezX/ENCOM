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
        <script>
            $(document).ready(function(){
               $("#search").show();
               $("#change").hide();
            });
        </script>
        <title>Modificar Usuario</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Modificar Usuario</li>
        </ol>
        <h1>Modificar Usuario</h1>
        <div id="search">
            <form method="post">
                <label for="idWT">Correo Electronico</label><br />
                <input type="email" id="idWT" required /><br />
                <button type="submit" class="btn btn-primary" onclick="return busquedaUsuarioM()">Buscar Usuario</button>
            </form>
        </div>
        <div id="change">
            <form method="post">
                <label for="correo">Correo Electronico</label><br />
                <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electronico" required readonly><br>
                <label for="passwd">Password</label><br />
                <input type="password" id="passwd" name="passwd" required ><br />
                <label for="idW">Numero de Trabajador</label><br />
                <input type="number" id="idW" name="idW" placeholder="1,2,3,2552.." required><br />
                <label for="nombre">Nombre Usuario</label><br />
                <input type="text" id="nombre" name="nombre" required readonly><br />
                <label for="direccion">Direccion</label>
                <input type="text" id="direccion" name="direccion" required><br />
                <input type="text" id="typeusr" readonly size="25"><br />
                <button type="submit" class="btn btn-success" onclick="return updateUser()">Actualizar Usuario</button>
            </form>
        </div>
    </body>
</html>
