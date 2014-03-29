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
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script>
            
            if(localStorage.getItem("Sesion")!=null){
                 if(localStorage.getItem("Admin").tostring()==false){
                     window.location.href="../index.jsp";
                 }
             } else{
                 window.location.href="../index.jsp";
             }
             
            $(document).ready(function(){
               jQuery("#eventos").hide();
               jQuery("#usuarios").hide();
            });
            
            function ShowEventos(){
                jQuery("#eventos").show();
                jQuery("#usuarios").hide();
            }
            function ShowUsuarios(){
                jQuery("#eventos").hide();
                jQuery("#usuarios").show();
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
                        <li><a href="Eventos/RegistrarEvento.jsp">Registrar Eventos</a></li>
                        <li><a href="Eventos/ConsultaEventos.jsp">Consultar Eventos</a></li>
                        <li><a href="Eventos/ModificarEvento.jsp">Modificar Eventos</a></li>
                        <li><a href="Eventos/CaducarEvento.jsp">Caducar Eventos</a></li>
                    </ol>
                </div>
                <a href="#" onclick="return ShowUsuarios()">Panel Usuarios</a><br />
                <div id="usuarios">
                    <ol>
                        <li><a href="Usuarios/RegistrarUsuarios.jsp">Registrar Usuarios</a></li>
                        <li><a href="Usuarios/ConsultarUsuario.jsp">Consulta General Usuarios</a></li>
                        <li><a href="Usuarios/ConsultaUsuario.jsp">Consulta Individual Usuario</a></li>
                        <li><a href="Usuarios/ModificarUsuario.jsp">Modificar Usuario</a></li>
                        <li><a href="Usuarios/EliminarUsuario.jsp">Eliminar Usuario</a></li>
                    </ol>
                </div>
                <a href="#">Panel Horarios(Proximamente)</a><br />
                <a href="#">Panel Incidencias(Proximamente)</a><br />
            </div>
        </div>
        
    </body>
</html>
