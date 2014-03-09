<%-- 
    Document   : index
    Created on : 02-mar-2014, 9:09:07
    Author     : santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/client.js"></script>
        <title>HYENIX</title>
    </head>
    <body>
        <div class="panel">
            <div class="panel panel-heading">
                <h1>HYENIX</h1>
            </div>
            <div class="panel panel-body">
                <div class="well">
                    <p>Iniciar Sesion</p>
                    <form method="post" role="form" autocomplete="off">
                        <div class="input-group">
                            <span class="input-group-addon">@</span><input type="email" class="form-control" name="correo" id="correo" required autofocus ><br />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"> #</span><input type="password" class="form-control" name="passwd" id="passwd" required><br />
                        </div>
                        <input type="radio" name="typeusr" value="0">Profesor &nbsp;
                        <input type="radio" name="typeusr" value="1">Administrador<br />
                        <button class="btn btn-default" id="btnSession" onclick="return iniciarSesion()">Iniciar Sesion</button>
                    </form>
                </div>
            </div>
            <div class="panel panel-footer">
                <p>Desarrollado por HYENIX</p>
            </div>
        </div>
    </body>
</html>
