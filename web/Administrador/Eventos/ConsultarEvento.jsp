<%-- 
    Document   : Usuarios
    Created on : 9/03/2014, 01:58:41 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultar Eventos</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/eventos.js"></script>
        <script>
            $(document).ready(function(){
               obtenerEventos(); 
            });
        </script>
		<style>
			div.mostrar{
				border:1px solid rgba(128,128,128,.4);
				padding:10px;
				border-radius:5px;
				background-color:rgba(128,128,128,.05);
			}
		</style>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Consulta Eventos</li>
        </ol>
        <div class="mostrar">
        <table class="table table-striped" id="tabla">
            <tr>
                <th>ID</th>
                <th>Nombre Evento</th>
                <th>Descripcion</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Duracion</th>
            </tr>
        </table>
		</div>
    </body>
</html>
