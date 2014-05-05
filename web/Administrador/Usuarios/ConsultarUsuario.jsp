<%-- 
    Document   : ConsultarUsuario
    Created on : 19/03/2014, 09:23:39 AM
    Author     : Alumnos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/jquery.color-2.1.2.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/usuarios.js"></script>
        <script>
            $(document).ready(function() {
                obtenerUsuarios();
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
        <h3>Consultar Usuarios</h3>
        <br/>
        <div class="mostrar">
            <table class="table table-striped" id="tabla">
                <tr>
                    <th>Nombre</th>
                    <th>ID</th>
                    <th>Correo Electronico</th>
                    <th>Direccion</th>
                    <th>Administrador</th>
                </tr>
            </table>
        </div>
    </body>
</html>
