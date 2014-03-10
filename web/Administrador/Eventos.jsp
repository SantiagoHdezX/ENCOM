<%-- 
    Document   : Eventos
    Created on : 9/03/2014, 01:58:20 PM
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
        <title>Eventos</title>
    </head>
    <body>
        <div>
            <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="index.jsp">Menu Administrador</a></li>
            <li class="active">Registrar Eventos</li>
            </ol>
            <h1>Registrar evento</h1>
            <form method="post">
                <label for="nombre">Nombre del evento</label><br />
                <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre del evento" required autofocus><br>
                <label for="fecha">Fecha</label><br />
                <input type="date" id="fecha" name="fecha" required><br />
                <label for="hora">Hora</label><br />
                <input type="time" id="hora" name="hora" required><br />
                <label for="duracion">Duracion(en horas)</label>
                <input type="number" name="duracion" value=1 id="duracion" min="1" max="5"><br />
                <label for="descripcion">Descripcion del evento</label><br />
                <textarea id="descripcion" name="descripcion" required></textarea><br />
                <button type="submit" class="btn btn-success" onclick="return registrarEvento()">Registrar Evento</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </form>
        </div>
    </body>
</html>
