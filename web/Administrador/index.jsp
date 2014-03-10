<%-- 
    Document   : menuAdministrador
    Created on : 6/03/2014, 10:16:31 PM
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador-HYENIX</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
               jQuery("#eventos").hide();
            });
            
            function ShowEventos(){
                jQuery("#eventos").show();
            }
        </script>
    </head>
    <body>
        <ol class="breadcrumb">
            <li><a href="#">Inicio</a></li>
            <li class="active">Menu Administrador</li>
        </ol>
        <div class="panel panel-primary">
            <div class="panel panel-heading">
                Menu Administrador
            </div>
            <div class="panel panel-body">
                <a href="#" onclick="return ShowEventos()">Panel Eventos</a><br />
                <div id="eventos">
                    <ol>
                        <li><a href="Eventos.jsp">Registrar Eventos</a></li>
                        <li><a href="ConsultaEventos.jsp">Consultar Eventos</a></li>
                        <li><a href="ModificarEvento.jsp">Modificar Eventos</a></li>
                        <li><a href="CaducarEvento.jsp">Caducar Eventos</a></li>
                    </ol>
                </div>
                <a href="#">Panel Usuarios(Proximamente)</a><br />
                <a href="#">Panel Horarios(Proximamente)</a><br />
                <a href="#">Panel Usuarios(Proximamente)</a><br />
            </div>
        </div>
        
    </body>
</html>
