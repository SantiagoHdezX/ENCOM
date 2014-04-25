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
        </style>
    </head>
    <body>
        <h3>Caducar Evento</h3>
		<form>
			<div class="campo">
				<label for="nombre">Nombre del Evento(Tal y como fue creado)</label><br />
				<input type="text" name="Nombre" id="nombre" placeholder="Ingresa el nombre del evento" required>&emsp;&emsp;
				<button type="submit" class="btn btn-danger" onclick="return CaducarEvento()">Caducar</button>
			</div>
		</form>
    </body>
</html>
