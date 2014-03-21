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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="../../js/jquery-1.11.0.min.js"></script>
        <script src="../../js/client.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
               obtenerEventos(); 
            });
        </script>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="../index.jsp">Menu Administrador</a></li>
            <li class="active">Consulta Eventos</li>
        </ol>
        
        <table class="table table-striped" id="tabla">
            <tr>
                <th>Nombre Evento</th>
                <th>Descripcion</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Duracion</th>
            </tr>
        </table>
    </body>
</html>
