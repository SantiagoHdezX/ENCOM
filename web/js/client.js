/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



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
                $.ajax
                ({
                    async:false,
                    type:'POST',
                    contentType:'application/json',
                    url:'http://localhost:8080/ENCOM/API/Usuarios/IniciarSesion',
                    dataType:"json",
                    data: JSONsrcInfo,
                    success:function(data){
                        if(data.Sesion == true){
                            if(data.Admin_User==true){
                                localStorage.setItem("Sesion",true);
                                localStorage.setItem("Admin",true);
                                window.location="Administrador/index.jsp";
                            }
                            else{
                                localStorage.setItem("Sesion",true);
                                localStorage.setItem("Admin",false);
                                window.location="Profesor/menuUsuario.jsp";
                            }
                        }
                        else{
                            localStorage.setItem("Sesion",false);
                            localStorage.setItem("Admin",false);
                            alert(data.Mensaje);
                            window.location="index.jsp";
                        }
                    },
                    error:function(xhr ,ajaxOptions, thrownError ){
                        alert(JSON.stringify(xhr));
                    }
                });
                return false;
            }
            function registrarEvento(){
                var sourceInfo={};
                sourceInfo.Nombre=jQuery("#nombre").val();
                sourceInfo.Descripcion=jQuery("#descripcion").val();
                sourceInfo.Fecha=jQuery("#fecha").val();
                sourceInfo.Hora=jQuery("#hora").val()+":00";
                sourceInfo.Duracion=jQuery("#duracion").val();
                
                var jsonString=JSON.stringify(sourceInfo);
                $.ajax({
                            async:true,
                            type:'POST',
                            contentType:'application/json',
                            url:'http://localhost:8080/ENCOM/API/Eventos/RegistrarEvento',
                            dataType:"json",
                            data:jsonString,
                            success:function(data){
                                alert(data.Mensaje);
                            },
                            error:function(xhr ,ajaxOptions, thrownError ){
                                alert(JSON.stringify(xhr));
                            }
                        }
                        );
                return false;
            }
            function obtenerEventos(){
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:8080/ENCOM/API/Eventos/ObtenerEventos',
                    dataType: "json",
                    success: function(data){
                        for(var evento in data.Eventos){
                            var tr = document.createElement('tr');
                            var td1 = document.createElement('td');
                            var td2 = document.createElement('td');
                            var td3 = document.createElement('td');
                            var td4 = document.createElement('td');
                            var td5 = document.createElement('td');
                            var evts=data.Eventos[evento]; 
                            var text1 = document.createTextNode(evts.Nombre);
                            var text2 = document.createTextNode(evts.Descripcion);
                            var text3 = document.createTextNode(evts.Fecha);
                            var text4 = document.createTextNode(evts.Hora);
                            var text5 = document.createTextNode(evts.Duracion);
                            
                            td1.appendChild(text1);
                            td2.appendChild(text2);
                            td3.appendChild(text3);
                            td4.appendChild(text4);
                            td5.appendChild(text5);
                            tr.appendChild(td1);
                            tr.appendChild(td2);
                            tr.appendChild(td3);
                            tr.appendChild(td4);
                            tr.appendChild(td5);
                            document.getElementById("tabla").appendChild(tr);
                        }
                    },
                    error:function(xhr ,ajaxOptions, thrownError ){
                        alert(JSON.stringify(xhr));
                    }
                });
                return false;
            }
            function obtenerEventoIndividual(){
                var src={};
                src.Nombre=jQuery("#nombre").val();
                var srcJs=JSON.stringify(src);
                 $.ajax({
                    type: 'POST',
                    contentType:'application/json',
                    url: 'http://localhost:8080/ENCOM/API/Eventos/ObtenerDatosEvento',
                    dataType: "json",
                    data:srcJs,
                    success: function(data){
                        if(data.Busqueda==true)
                        {
                            jQuery("#busqueda").hide();
                            jQuery("#modificar").show();
                            $("#nombre2").val(data.Nombre);
                            $("#descripcion").val(data.Descripcion);
                            $("#fecha").val(data.Fecha);
                            $("#hora").val(data.Hora);
                            $("#duracion").val(data.Duracion);
                        }
                        else{
                            alert(data.Mensaje);
                        }
                    },
                    error:function(xhr ,ajaxOptions, thrownError ){
                                alert(JSON.stringify(xhr));
                    }
                });
                return false;
            }
            function actualizarEvento(){
                var sourceInfo={};
                sourceInfo.Nombre=jQuery("#nombre2").val();
                sourceInfo.Descripcion=jQuery("#descripcion").val();
                sourceInfo.Fecha=jQuery("#fecha").val();
                var tmpHora=jQuery("#hora").val();
                if(tmpHora.length==8){
                    sourceInfo.Hora=tmpHora;
                }
                else{
                    sourceInfo.Hora=tmpHora+":00";
                }
                sourceInfo.Duracion=jQuery("#duracion").val();
                
                var jsonString=JSON.stringify(sourceInfo);
                $.ajax({
                            async:true,
                            type:'PUT',
                            contentType:'application/json',
                            url:'http://localhost:8080/ENCOM/API/Eventos/ModificarEvento',
                            dataType:"json",
                            data:jsonString,
                            success:function(data){
                                alert(data.Mensaje);
                            },
                            error:function(xhr ,ajaxOptions, thrownError ){
                                alert(JSON.stringify(xhr));
                            }
                        }
                        );
                return false;
            }
            function CaducarEvento(){
                var x=confirm("Esta seguro que quiere caducar el evento? Una vez realizado no se podra recuperar");
                if(x==true){
                    var src={};
                    src.Nombre=jQuery("#nombre").val();
                    var srcJs=JSON.stringify(src);
                     $.ajax({
                        type: 'PUT',
                        contentType:'application/json',
                        url: 'http://localhost:8080/ENCOM/API/Eventos/CaducarEvento',
                        dataType: "json",
                        data:srcJs,
                        success: function(data){
                            if(data.Deshabilitar==true){
                                alert(data.Mensaje);
                                window.location="ConsultaEventos.jsp";
                            }
                            else{
                                alert(data.Mensaje);
                            }
                        },
                        error:function(xhr ,ajaxOptions, thrownError ){
                                    alert(JSON.stringify(xhr));
                        }
                });
            }
            else{
                return false;
            }
            return false;
        }