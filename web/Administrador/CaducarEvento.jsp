<%-- 
    Document   : CaducarEvento
    Created on : 9/03/2014, 10:17:38 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <title>Caducar Evento</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="index.jsp">Menu Administrador</a></li>
            <li class="active">Caducar Evento</li>
        </ol>
        <h1>Caducar Evento</h1>
        <form>
            <label for="nombre">Nombre del Evento(Tal y como fue creado)</label><br />
            <input type="text" name="Nombre" id="nombre" placeholder="Ingresa el nombre del evento" required><br /><br />
            <button type="submit" class="btn btn-danger" onclick="return CaducarEvento()">Caducar</button>
        </form>
    </body>
</html>
