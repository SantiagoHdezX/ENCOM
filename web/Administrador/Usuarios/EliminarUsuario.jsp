<%-- 
    Document   : EliminarUsuario
    Created on : 20/03/2014, 11:40:21 PM
    Author     : Santiago
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
                $("input").focus(function() {
                    $(this).parent().css({
                        "border": "1px solid rgba(0,0,255,.4)",
                        "background-color": "rgba(0,0,255,.3)"});
                });
                $("#idW").blur(function() {
                    var x = $(this).val();
                    var atpos = x.indexOf("@");
                    var dotpos = x.lastIndexOf(".");
                    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length)
                    {
                        $(this).parent().animate({"backgroundColor": "rgba(255,0,0,.3)", "border": "1px solid rgba(255,0,0,.4)"}, "slow");
                    }
                    else {
                        $(this).parent().animate({"backgroundColor": "rgba(0,255,0,.3)", "border": "1px solid rgba(0,255,0,.4)"}, "slow");
                    }
                });
            });
        </script>
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
        <h3>Eliminar Usuario</h3>
        <br/>
        <form method="post">
            <div class="campo">
                <label for="nombre">Correo Electronico del Usuario</label><br />
                <input type="email" name="idW" id="idW" placeholder="Ingrese el e-mail del usuario" required>                
            </div>
            <br/>
            <div class="campo" style="width: 250px; margin:auto; padding:10px 50px">
                <button type="submit" class="btn btn-danger" onclick="return EliminarUsuario()">Eliminar</button>
            </div>
        </form>
    </body>
</html>
