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
                                window.location="Administrador/menuAdministrador.jsp";
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