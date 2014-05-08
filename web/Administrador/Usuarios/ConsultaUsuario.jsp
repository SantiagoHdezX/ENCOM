<%-- 
    Document   : ConsultaUsuario
    Created on : 10/03/2014, 02:33:48 PM
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
        <style>
            div.ajax{
                border:1px solid rgba(128,128,128,.4);
                padding:10px;
                border-radius:5px;
                background-color:rgba(128,128,128,.1);
            }
            div.campo{
                width:500px;
            }
            div.campo label{
                padding: 10px 0;
            }
            div#mostrar{
                background-color:rgba(128,128,128,.05);
            }
        </style>
    </head>
    <body>
        <h3>Consultar Usuario</h3>
        <br/>
        <div id="busqueda">
            <form>
                <div class="campo ajax">
                    <label for="idW">Correo del trabajador</label><br />
                    <input type="email" id="idWT" name="idWT" placeholder="Ingrese el e-mail del trabajador" required>                
                </div>
                <br/>
                <div class="campo ajax" style="width: 250px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-info" onclick="return busquedaUsuario()">Buscar Usuario</button>
                </div>
            </form>
        </div>
        <div id="mostrar" class="ajax" style="display:none">
            <table class="table table-bordered" id="tabla">
                <tr>
                    <th>Correo</th>
                    <th>Password</th>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Tipo_Usuario</th>
                </tr>
            </table>
        </div>
    </body>
</html>
