<%-- 
    Document   : menuUsuario
    Created on : 6/03/2014, 10:16:17 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesor-HYENIX</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>
        
        if(localStorage.getItem("Sesion")!=null){
            if(localStorage.getItem("Admin")==true){
                window.location.href="../index.jsp";
            }
        }
                
            $(document).ready(function(){       
               obtenerEventos(); 
            });
        </script>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li><a href="#">Menu Usuarios</a></li>
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
