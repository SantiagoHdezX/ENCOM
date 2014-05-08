<%-- 
    Document   : RegistrarUsuarios
    Created on : 10/03/2014, 02:06:16 PM
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
        <h3>Registrar Usuario</h3>
        <br/>
        <form method="post" name="RegisUs">

            <div class="campo" id="correodiv">
                <label for="correo">Correo Electronico</label><br>
                <input type="email" id="correo" name="correo" placeholder="Ingrese un e-mail válido">
            </div>
            <br>
            <div class="campo" id="passwddiv">
                <label for="passwd">Password</label><br>
                <input type="password" id="passwd" name="passwd" placeholder="Ingrese una contraseña" />
            </div>
            <br>
            <div class="campo">
                <label for="cpasswd"> Confirmar Password</label><br>
                <input type="password" id="cpasswd" name="cpasswd" placeholder="Ingrese nuevamente la contraseña">
            </div>
            <br>
            <div class="campo" id="numdiv">
                <label for="idW">Numero de Trabajador</label><br>
                <input type="number" id="idW" name="idW" min="1" placeholder="0000">
            </div>
            <br>
            <div class="campo" id="nomdiv">
                <label for="nombre">Nombre Usuario</label><br>
                <input type="text" id="nombre" name="nombre" placeholder="Ingrese un nombre de usuario">
            </div>
            <br>
            <div class="campo" id="dirdiv">
                <label for="direccion">Direccion</label><br>
                <textarea  id="direccion" name="direccion" rows="3" placeholder="Ingrese una dirección"></textarea>
            </div>
            <br>
            <div class="campo">	
                <table width="100%">
                    <tr>
                        <td align="center">
                            <input type="radio" name="typeusr" value="0" checked> Profesor
                        </td>
                        <td align="center">
                            <input type="radio" name="typeusr" value="1"> Administrador
                        </td>
                    </tr>
                </table>
            </div>
            <br>
            <div class="campo" style="width: 407px; margin:auto; padding:10px 50px">
                <button type="submit" class="btn btn-success" onclick="return registrarUsuario()">Registrar Usuario</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </div>
        </form>
    </body>
</html>
