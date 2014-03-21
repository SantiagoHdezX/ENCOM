<%-- 
    Document   : ModificarEvento
    Created on : 9/03/2014, 10:17:27 PM
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
        <script>
             $(document).ready(function(){
               jQuery("#busqueda").show();
               jQuery("#modificar").hide();
            });
        </script>
        <title>Modificar Evento</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Modificar Eventos</li>
        </ol>
        <div id="busqueda">
            <h1>Buscar Evento</h1>
            <form method="post">
                <label for="nombre">Nombre del Evento(Tal y como fue creado)</label><br />
                <input type="text" name="Nombre" id="nombre" required><br /><br />
                <button type="submit" class="btn btn-default" onclick="return obtenerEventoIndividual()">Obtener datos</button>
            </form>
        </div>
        <div id="modificar">
            <form method="post">
                <label for="nombre2">Nombre del evento</label><br />
                <input type="text" id="nombre2" name="nombre" readonly><br>
                <label for="fecha">Fecha</label><br />
                <input type="date" id="fecha" name="fecha" required><br />
                <label for="hora">Hora</label><br />
                <input type="time" id="hora" name="hora" required><br />
                <label for="duracion">Duracion(en horas)</label>
                <input type="number" name="duracion" value=1 id="duracion" min="1" max="5"><br />
                <label for="descripcion">Descripcion del evento</label><br />
                <textarea id="descripcion" name="descripcion" required></textarea><br />
                <button type="submit" class="btn btn-success" onclick="return actualizarEvento()">Registrar Evento</button>
            </form>
        </div>
    </body>
</html>
