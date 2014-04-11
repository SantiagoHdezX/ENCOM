<%-- 
    Document   : index
    Created on : 6/03/2014, 10:16:17 PM
    Author     : Santiago
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesor</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/profesor.css"/>
        <link rel="stylesheet" type="text/css" href="../css/main.css"/>
        <link rel="stylesheet" type="text/css" href="../css/nav-bar.css"/>
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/jquery.color-2.1.2.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/nav-bar.js"></script>
        <script src="../js/administrador.js"></script>
        <script>
        if(localStorage.getItem("Sesion")!=null){
            if(localStorage.getItem("Admin").toString()=="true"){
                window.location.href="../index.jsp";
            }
        } else{
            window.location.href="../index.jsp";
        }
                
            $(document).ready(function(){       
               obtenerEventos(); 
            });
        </script>
    </head>        
    <body>
        <div class="notif-box" id="notif-box">
        </div>
        <div class="ipn-header">
            <div class="ipn-logo">
                <img class="logo" src="../images/ipn-w.png"/>
                <p>
                INSTITUTO POLITECNICO NACIONAL
                </br>
                "La T&eacute;cnica al Servicio de la Patria"				
                </p>
            </div>
        </div>
        <div class="main-cont">        
            <div class="main-cont-box">
                <div class="nav-bar">
                    <div class="firstln"></div>
                    <div class="nextln"></div>
                    <div class="scnd-menu-image"></div>
                    <section class="main">
                        <ul class="ch-grid">
                            <li>
                                <div class="ch-item ch-img-1 m1">
                                    <div class="ch-info">
                                        <span id="spn1"><h3>Incidencias</h3></span>		
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="ch-item ch-img-2 m2">
                                    <div class="ch-info">
                                        <span id="spn2"><h3>Horarios</h3></span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="ch-item ch-img-3 m3">
                                    <div class="ch-info">
                                        <span id="spn3"><h3>Eventos</h3></span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="ch-item ch-img-4 m4">
                                    <div class="ch-info">
                                        <span id="spn4"><h3>Usuarios</h3></span>
                                    </div>
                                </div>                                
                            </li>
                        </ul>                       
                    </section>
                    <div class="scnd-menu">
                        <div class="bottomln ln1 ex"></div>
                        <div class="bottomln ln2 ex"></div>
                        <div class="li1">
                            <div class="next-menu ex m1">
                                <ul class="scnd-menu-options">
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="li2">
                            <div class="next-menu ex m2">
                                <ul class="scnd-menu-options">
                                </ul>
                            </div>
                        </div>
                        <div class="li3">                            
                            <div class="next-menu ex m3">
                                <ul class="scnd-menu-options">
                                    <li>Registrar Evento</li>
                                    <li>Consultar Evento</li>
                                    <li>Modificar Evento</li>
                                    <li>Caducar Evento</li>
                                </ul>
                            </div>
                        </div>
                        <div class="li4">
                            <div class="next-menu ex m4">
                                <ul class="scnd-menu-options">
                                    <li>Registrar Usuarios</li>
                                    <li>Consulta General</li>
                                    <li>Consulta Individual</li>
                                    <li>Modificar Usuario</li>
                                    <li>Eliminar Usuario</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cont-box">
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
                    <div onclick="cerrarSesion()" class="btn btn-warning">Cerrar Sesion</div>
                </div>
            </div>
        </div>			
    </body>
</html>
    <!--
    <div class="news news-cont">
        <div class="news news-cont-access" id="news-access">
            <span>Noticias</span>
        </div>
        <div class="news news-cont-box" id="news-mostrar">

        </div>				
    </div>
    -->
