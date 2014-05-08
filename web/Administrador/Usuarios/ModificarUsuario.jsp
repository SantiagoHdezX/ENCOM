<%-- 
    Document   : ModificarUsuario
    Created on : 19/03/2014, 10:54:31 AM
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
        <h3>Modificar Usuario</h3>
        <br/>
        <form method="post">
            <div id="search">
                <div class="campo">
                    <label for="idWT">Correo Electronico</label><br />
                    <input type="email" id="idWT" placeholder="Ingrese un e-mail válido" required />
                </div>
                <br/>
                <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-warning" id="btn" onclick="return busquedaUsuarioM()">Buscar Usuario</button>
                </div>
            </div>
        </form>
        <br>
        <div id="change" style="display:none">
            <form method="post">
                <div class="campo">
                    <label for="correo">Correo Electronico</label><br>
                    <input type="email" id="correo" name="correo" disabled="disabled" placeholder="ejemplo@xxx.com">
                    <input type="hidden" id="correo" name="correo">
                </div>
                <br>
                <div class="campo" id="passwddiv" i=1>
                    <label for="passwd">Password</label><br>
                    <input type="password" id="passwd" name="passwd" />
                </div>
                <br>
                <div class="campo">
                    <label for="cpasswd"> Confirmar Password</label><br>
                    <input type="password" id="cpasswd" name="cpasswd">
                </div>
                <br>
                <div class="campo" id="numdiv" i=1>
                    <label for="idW">Numero de Empleado</label><br>
                    <input type="number" id="idW" name="idW">
                </div>
                <br>
                <div class="campo">
                    <label for="nombre">Nombre Usuario</label><br>
                    <input type="text" id="nombre" name="nombre">
                </div>
                <br>
                <div class="campo" id="dirdiv" i=1>
                    <label for="direccion">Direccion</label><br>
                    <textarea id="direccion" name="direccion"></textarea>
                </div>
                <br>
                <div class="campo">
                    <label for="permisos">Permisos</label><br>
                    <input type="text" disabled="disabled" id="typeusr">
                </div>
                <br>
                <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                    <button type="submit" class="btn btn-success" onclick="return updateUser()">Actualizar Usuario</button>
                </div>
            </form>
        </div>
    </body>
</html>
