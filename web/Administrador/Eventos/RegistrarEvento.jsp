<%-- 
    Document   : Eventos
    Created on : 9/03/2014, 01:58:20 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.color-2.1.2.js"></script>
        <script src="../js/eventos.js"></script>
        <style>
            div.campo{
                border:1px solid rgba(128,128,128,.4);
                padding:10px;
                width:500px;
                border-radius:5px;
                background-color:rgba(128,128,128,.1);
            }
            div.campo label{
                padding: 10px 0;
            }
        </style>
        <title>Eventos</title>
    </head>
    <body>
        <div>
            <h3>Registrar evento</h3>
            <br/>
            <form method="post">
                <div class="campo">
                    <label for="nombre">Nombre del evento</label><br />
                    <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre del evento" required><br>
                </div><br>
                <div class="campo">
                    <label for="fecha">Fecha</label><br />
                    <input style="height:32px;" type="date" id="fecha" name="fecha" required><br />
                </div><br>
                <div class="campo">
                    <label for="hora">Hora (formato 24 hr)</label><br />
                    <input style="height:32px;" type="time" id="hora" name="hora" min="08:00" max="20:00" required><br />
                </div><br>
                <div class="campo">
                    <label for="duracion">Duracion(en horas)</label>
                    <input style="height:32px;" type="number" name="duracion" value=1 id="duracion" min="1" max="5"><br />
                </div><br>
                <div class="campo">
                    <label for="descripcion">Descripcion del evento</label><br />
                    <textarea id="descripcion" name="descripcion" required></textarea><br />
                </div><br>
                <div class="campo" style="width: 407px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-success" onclick="return registrarEvento()">Registrar Evento</button>
                    <button type="reset" class="btn btn-warning">Reset</button>
                </div>
            </form>
        </div>
    </body>
</html>
