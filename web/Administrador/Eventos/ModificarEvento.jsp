<%-- 
    Document   : ModificarEvento
    Created on : 9/03/2014, 10:17:27 PM
    Author     : HYENIX
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
    </head>
    <body>
        <h3>Modificar Evento</h3>
        <br/>
        <div id="busqueda">
            <form method="post">
                <div class="campo">
                    <label for="nombre">Nombre del Evento</label><br />
                    <input type="text" name="Nombre" id="nombre" placeholder="Ingrese el nombre exacto del evento"required>                    
                </div>
                <br/>
                <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-info" onclick="return obtenerEventoIndividual()">Obtener datos</button>
                </div>
            </form>
        </div>
        <div id="modificar" style="display:none;">
            <form method="post">
                <div class="campo">
                    <label for="nombre2">Nombre del evento</label><br />
                    <input type="text" id="nombre2" name="nombre" required>
                </div><br>
                <div class="campo">
                    <label for="fecha">Fecha</label><br />
                    <input type="date" id="fecha" name="fecha" required>
                </div><br>
                <div class="campo">
                    <label for="hora">Hora</label><br />
                    <input type="time" id="hora" name="hora" required>
                </div><br>
                <div class="campo">	
                    <label for="duracion">Duracion(en horas)</label>
                    <input type="number" name="duracion" value=1 id="duracion" min="1" max="5">
                </div><br>
                <div class="campo">	
                    <label for="descripcion">Descripcion del evento</label><br />
                    <textarea id="descripcion" name="descripcion" required></textarea>
                </div>
                <br>
                <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-success" onclick="return actualizarEvento()">Modificar Evento</button>
                </div>
            </form>
        </div>
    </body>
</html>
