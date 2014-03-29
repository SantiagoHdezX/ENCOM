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
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/aviaslider.css"/>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/jquery.color-2.1.2.js"></script>
        <script src='js/jquery.aviaSlider.js'></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/client.js"></script>
	<script src='js/aviaSlider.js'></script>
        <script src="js/index.js"></script>
        <script>
            /*Nota
             * Por alguna razon curiosa, esta funcion nomas funca en IE y en Firefox
             * 
             * EN CHROME NO!
             * */
            $(document).ready(function(){
                if(JSON.parse(localStorage.getItem("Sesion"))!==null){
                    if(JSON.parse(localStorage.getItem("Sesion"))==true){
                        if(JSON.parse(localStorage.getItem("Admin"))==true){
                            window.location("Administrador/index.jsp");
                        }
                        else{
                            window.location("Profesor/index.jsp");
                        }
                    }
                }
            });
        </script>
        <style>
            div.well{
                width: 380px; 
                height: 250px;
                float: right;
                margin-right: 20px;
                position: relative;
            }
            div.well button{
                float: right;
            }
            div.sesion-image-prof, div.sesion-image-admin{
                background-size: 100% 100%;
                margin-left: 50px;
                width: 250px; 
                height: 250px;
                float: left;                
            }
            div.sesion-image-prof{
                background-image: url('images/profesor.png');
                display: block;
            }
            div.sesion-image-admin{
                background-image: url('images/admin.png');
                display:none;
            }
        </style>
        <title>Home Page</title>
    </head>
    <body>
        <div class="ipn-header">
            <div class="ipn-logo">
                <img class="logo" src="images/ipn-w.png"/>
                <p>
                INSTITUTO POLITECNICO NACIONAL
                <br/>
                "La T&eacute;cnica al Servicio de la Patria"				
                </p>
            </div>
        </div>
        <div class="main-cont">
            <div class="main-cont-box">
                <br/>
                <div class="aviaslider" id="galery">
                    <div class="featured"><a href=""><img src="images/slides/1.jpg" width="800px" alt="Imagenes de prueba"/></a></div>	
                    <div class="featured"><a href=""><img src="images/slides/2.jpg" width="800px" alt=""/></a></div>	
                    <div class="featured"><a href=""><img src="images/slides/3.jpg" width="800px" alt=""/></a></div>	
                </div>
                <br/>
                <div class="cont-box">
                    <div class="well">
                        <p>Iniciar Sesion</p>
                        <form method="post" role="form">
                            <div class="input-group">
                                <span class="input-group-addon" title="E-mail">@</span><input type="email" class="form-control" name="correo" id="correo" required autofocus ><br />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon" title="Contraseña">&nbsp;#&nbsp;</span><input type="password" class="form-control" name="passwd" id="passwd" required><br />
                            </div>
                            <br />
                            <p id="rdBtns" align="right" style="padding: 0; margin: 0;">
                                <input type="radio" name="typeusr" id="rdProf" value="0" checked="checked"> Profesor &nbsp;
                                <input type="radio" name="typeusr" id="rdAdmin" value="1"> Administrador<br />
                            </p>
                            <br />
                            <button class="btn btn-default" id="btnSession" onclick="return iniciarSesion()">Iniciar Sesion</button>
                        </form>
                    </div>
                    <div class="sesion-image-admin">
                    </div>
                    <div class="sesion-image-prof">
                    </div>
                </div>
                <br/>
            </div>
            <div class="footer">
                Sitio Web creado por HYENIX.
            </div>
        </div>				
    </body>
</html>
