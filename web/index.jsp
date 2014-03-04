<%-- 
    Document   : index
    Created on : 02-mar-2014, 9:09:07
    Author     : santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-2.1.0.min.js"></script>
        <script>
            $("#btnSession").click(function(){
                $.ajax
                ({
                    type:POST,
                    url:"http://localhost:8080/ENCOM/API/Usuarios/IniciarSesion",
                    contentType:"application/json",
                    dataType:"json",
                    data: iniciarSesion(),
                    success:function(data){
                        alert(data);
                    },
                    error:function(xhr){
                        alert(xhr);
                    }
                });
            });
            
            function iniciarSesion(){
                var sourceInfo={};
                sourceInfo.correo = jQuery("#correo").val();
                sourceInfo.password = jQuery("#passwd").val();
                var admin=$('input:radio[name=typeusr]:checked').val();
                if(admin == "1"){
                    sourceInfo.administrador = true;
                }
                else{
                    sourceInfo.administrador = false;
                }
                var JSONsrcInfo=JSON.stringify(sourceInfo);
                return JSONsrcInfo;
            }
        </script>
        <title>HYENIX</title>
    </head>
    <body>
        <div class="panel">
            <div class="panel panel-heading">
                <h1>HIENIX</h1>
            </div>
            <div class="panel panel-body">
                <div class="well">
                    <p>Iniciar Sesion</p>
                    <form>
                        <label for="correo">Correo Electronico</label><br />
                        <input type="email" name="correo" id="correo" required><br />
                        <label for="passwd">Password</label><br />
                        <input type="password" name="passwd" id="passwd" required><br />
                        <input type="radio" name="typeusr" value="0">Profesor &nbsp;
                        <input type="radio" name="typeusr" value="1">Administrador<br />
                        <button class="btn btn-default" id="btnSession">Iniciar Sesion</button>
                    </form>
                </div>
            </div>
            <div class="panel panel-footer">
                <p>Desarrollado por HIENIX</p>
            </div>
        </div>
    </body>
</html>
