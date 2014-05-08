<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script src="../js/client.js"></script>
        <script src="../js/jquery.color-2.1.2.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/horarios.js"></script>        
        <style>
            div.campo{
                border:1px solid rgba(128,128,128,.4);
                padding:10px;
                width:500px;
                border-radius:5px;
                background-color:rgba(128,128,128,.1);
            }
            div.campo td{
                padding: 10px;
            }
            div.campo label{
                padding: 10px 0;
            }
        </style>
    </head>
    <body>
        <h3>Registrar Materia</h3>
        <br/>
        <form method="post">
            <div class="campo">
                <label for="idMat">Id de la Materia</label><br />
                <input type="number" id="idMat" name="idMat" min=1 max=9999 placeholder="0000"/>
            </div><br/>
            <div class="campo">
                <label for="nombre">Nombre</label><br />
                <input type="text" id="nombreMat" name="nombreMat" placeholder="Ingrese el nombre de la materia."/>
            </div><br/>
            <div class="campo">
                <label for="semestre">Semestre</label></br>
                <input type="number" id="semestre" name="semestre" min=3 max=6 placeholder="3"/>
            </div><br/>
            <div class="campo" style="width:407px; margin:auto; padding:10px 50px">
                <button type="submit" class="btn btn-success" onclick="return registrarMateria()">Registrar Materia</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </div>
        </form>     
    </body>
</html>