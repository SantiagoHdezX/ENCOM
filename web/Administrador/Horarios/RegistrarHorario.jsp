<%-- 
    Document   : RegistrarHorario
    Created on : 8/05/2014, 03:24:22 AM
    Author     : uadec
--%>

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
            .styled-select select {
                background: transparent;
                width: 268px;
                padding: 0 5px;
                font-size: 16px;
                line-height: 1;
                border: 0;
                border-radius: 5px;
                height: 34px;
                -webkit-appearance: none;
            }
            .styled-select {
                width: 240px;
                height: 34px;
                overflow: hidden;
                border-radius: 5px;
                background: url(../images/arrow.png) no-repeat right white;
                border: 1px solid rgba(100,100,100,.5);
            }
        </style>
    </head>
    <body>
        <h3>Registrar Horario</h3>
        <br/>
        <div class="campo">
            <label for="semestre">Semestre</label><br />
            <input type="number" min="3" max="6" id="semestre" name="semestre" ajax="true" placeholder="3"/>
        </div><br/>
        <div class="campo">
            <label for="materia">Materia</label><br />
            <div class="styled-select">
                <select id="listaMaterias" disabled="disabled"></select>
            </div>
        </div><br/>
        <div class="campo">            
            <label for="grupo">Grupo</label><br />
            <div class="styled-select">
                <select id="listaGrupos" disabled="disabled"></select>
            </div>
        </div><br/>
        <div class="campo">
            <table>
                <tr>
                    <td></td>
                    <td>
                        Hora de Entrada
                    </td>
                    <td>
                        Hora de Salida
                    </td>
                </tr>
                <tr>
                    <td>
                        Lunes
                    </td>
                    <td>
                        <input type="time" id="LEntrada"/>
                    </td>
                    <td>
                        <input type="time" id="LSalida"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Martes
                    </td>
                    <td>
                        <input type="time" id="MEntrada"/>
                    </td>
                    <td>
                        <input type="time" id="MSalida"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Miércoles
                    </td>
                    <td>
                        <input type="time" id="MiEntrada"/>
                    </td>
                    <td>
                        <input type="time" id="MiSalida"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Jueves
                    </td>
                    <td>
                        <input type="time" id="JEntrada"/>
                    </td>
                    <td>
                        <input type="time" id="JSalida"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Viernes
                    </td>
                    <td>
                        <input type="time" id="VEntrada"/>
                    </td>
                    <td>
                        <input type="time" id="VSalida"/>
                    </td>
                </tr>
            </table>                  
        </div>
        <br/>
        <div class="campo" style="width:407px; margin:auto; padding:10px 50px">
            <button type="submit" class="btn btn-success" onclick="return registrarHorarioMat()">Registrar Horario</button>
            <button type="reset" class="btn btn-warning">Reset</button>
        </div>
    </body>
</html>

