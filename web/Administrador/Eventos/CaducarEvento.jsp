<%-- 
    Document   : CaducarEvento
    Created on : 9/03/2014, 10:17:38 PM
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
                border-radius:5px;
                background-color:rgba(128,128,128,.1);
                width:500px;
            }
            div.campo label{
                padding: 10px 0;
            }
        </style>
    </head>
    <body>
        <h3>Caducar Evento</h3>
        <br/>
        <form>
            <div class="campo">
                <label for="nombre">Nombre del Evento</label><br />
                <input type="text" name="Nombre" id="nombre" placeholder="Ingresa el nombre exacto del evento" required>                
            </div>
            <br/>
            <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                <button type="submit" class="btn btn-danger" onclick="return CaducarEvento()">Caducar Evento</button>
            </div>
        </form>
    </body>
</html>
