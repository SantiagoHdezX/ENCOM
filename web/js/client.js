/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function sesionFalse(men, status){
    var color={};
    color.rgb = (status=="BDError")?"rgb(230,95,0)":"rgb(255,0,0)";
    color.rgba = (status=="BDError")?"rgba(230,95,0,.7)":"rgb(255,0,0,.7)";
    color.msg = (status=="FatalError")?"white":color.rgb;
    color.finalBck = (status=="FatalError")?color.rgba:"rgb(245,245,245)";
    color.finalBrd =(status=="FatalError")?color.rgba:"#E3E3E3";
    men = (men=="Not Found")?"Houston tenemos un problema :(":men;
    $("#rdBtns").append("<span id='msg' style='display:none; width: 100px; color:"+color.msg+"; position:relative; float: left; font-size: small; text-align: left; bottom: 20px'>"+men+"</span>");
    var anim= $(".well, .input-group-addon");
        anim.animate({left: '15px'},100);
        anim.animate({left: '0px', right: '15px', backgroundColor: color.rgba, borderColor: color.rgb},100,function(){$("#msg").fadeIn("fast")});
        anim.animate({right: '0px', left: '15px'},100);
        anim.animate({left: '0px', backgroundColor: color.finalBck, borderColor: color.finalBrd},100); 
}

function iniciarSesion(){
                $("#msg").fadeOut("fast",function(){$(this).remove();});
                var sourceInfo={};
                sourceInfo.correo = jQuery("#correo").val();
                sourceInfo.password = jQuery("#passwd").val();
                if(sourceInfo.correo==""||sourceInfo.password==""){
                    sesionFalse("No puede dejar campos vacios","NoError");
                    return false;
                }
                sourceInfo.administrador = false; //default
                var admin=$('input:radio[name=typeusr]:checked').val();
                if(admin == "1"){
                    sourceInfo.administrador = true;
                }
                else if(admin == "0"){
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
                        if(data.Sesion != null){
                            if(data.Admin_User==true){
                                $("body").fadeOut("fast");                                       
                                localStorage.setItem("Sesion",true);
                                localStorage.setItem("Admin",true);
                                localStorage.setItem("ID", data.ID);
                                localStorage.setItem("Nombre", data.Nombre);
                                window.location="Administrador/";
                            }
                            else{
                                $("body").fadeOut("fast");
                                localStorage.setItem("Sesion",true);
                                localStorage.setItem("Admin",false);
                                localStorage.setItem("ID", data.ID);
                                localStorage.setItem("Nombre", data.Nombre);
                                window.location="Profesor/";
                            }
                        }
                        else{
                            if(data.Error == true){
                                sesionFalse(data.Mensaje, "BDError");
                            } else{
                                sesionFalse(data.Mensaje, "NoError");      
                            }
                            //window.location="index.jsp";
                        }
                    },
                    error:function(xhr ,ajaxOptions, thrownError){
                        sesionFalse(xhr.statusText,"FatalError");
                    }
                });
                return false;
            }

function cerrarSesion(){
    localStorage.removeItem("Nombre");
    localStorage.removeItem("Sesion");
    localStorage.removeItem("Admin");
    localStorage.removeItem("ID");
    $("body").fadeOut("fast",function(){window.location.href="../";});
}

function registrarEvento(){
    if($("#nombre").val()==""){
            alert("Ingrese un nombre para el evento.");
            $("#nombre").focus();
            return false;
    }else if($("#fecha").val()==""){
            alert("Ingrese una fecha para el evento.");
            $("#fecha").focus();
            return false;
    }else if($("#hora").val()==""){
            alert("Ingrese una hora para el evento.");
            $("#hora").focus();
            return false;
    }else if($("#descripcion").val()==""){
            alert("Ingrese una descripción ara el evento.");
            $("#descripcion").focus();
            return false;
    }
    var sourceInfo={};
    sourceInfo.Nombre=jQuery("#nombre").val();
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
                type:'POST',
                contentType:'application/json',
                url:'http://localhost:8080/ENCOM/API/Eventos/RegistrarEvento',
                dataType:"json",
                data:jsonString,
                success:function(data){
                    alert(data.Mensaje);
                    window.location="ConsultarEvento.jsp";
                },
                error:function(xhr ,ajaxOptions, thrownError ){
                    alert(xhr.statusText);
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
                var td = document.createElement('td');
                var td1 = document.createElement('td');
                var td2 = document.createElement('td');
                var td3 = document.createElement('td');
                var td4 = document.createElement('td');
                var td5 = document.createElement('td');
                var evts=data.Eventos[evento]; 
                var text = document.createTextNode(evts.ID_Evento) ;
                var text1 = document.createTextNode(evts.Nombre);
                var text2 = document.createTextNode(evts.Descripcion);
                var text3 = document.createTextNode(evts.Fecha);
                var text4 = document.createTextNode(evts.Hora);
                var text5 = document.createTextNode(evts.Duracion);
                td.appendChild(text);
                td1.appendChild(text1);
                td2.appendChild(text2);
                td3.appendChild(text3);
                td4.appendChild(text4);
                td5.appendChild(text5);
                tr.appendChild(td);
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);
                document.getElementById("tabla").appendChild(tr);
            }
        },
        error:function(xhr ,ajaxOptions, thrownError ){
            alert(xhr.statusText);
        }
    });
    return false;
}
function obtenerEventoIndividual(){
    var x=$("#nombre").val();
    if(x==""){
            alert("Ingrese un nombre en el campo.");
            return false;
    }
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
                    alert(xhr.statusText);
        }
    });
    return false;
}
function actualizarEvento(){
    if($("#fecha").val()==""){
            alert("Revise el campo de fecha.");
            $("#fecha").focus();
            return false;
    }else if($("#hora").val()==""){
            alert("Revise el campo de hora.");
            $("#hora").focus();
            return false;
    }else if($("#descripcion").val()==""){
            alert("Revise el campo de descripción.");
            $("#descripcion").focus();
            return false;
    }
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
                    window.location="ConsultaEventos.jsp";
                },
                error:function(xhr ,ajaxOptions, thrownError ){
                    alert(xhr.statusText);
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
                        alert(xhr.statusText);
            }
    });
}
else{
    return false;
}
    return false;
}
        
function registrarUsuario(){
    if($("#correodiv").attr("i")==1){
            alert("Revise el campo de correo electrónico.");
            $("#correo").focus();
            return false;
    }else if($("#passwddiv").attr("i")==1){
            alert("Revise los campos de password y confirmar password.");
            $("#passwd").focus();
            return false;
    }else if($("#numdiv").attr("i")==1){
            alert("Revise el campo de número de trabajador.");
            $("#idW").focus();
            return false;
    }else if($("#nomdiv").attr("i")==1){
            alert("Revise el campo de nombre de usuario.");
            $("#nombre").focus();
            return false;
    }else if($("#dirdiv").attr("i")==1){
            alert("Revise el campo de direccion.");
            $("#direccion").focus();
            return false;
    }
    var src={};
    src.correo=jQuery("#correo").val();
    src.password=jQuery("#passwd").val();
    src.id=jQuery("#idW").val();
    src.nombre=jQuery("#nombre").val();
    src.direccion=jQuery("#direccion").val();
    var admin=$('input:radio[name=typeusr]:checked').val();
    if(admin == "1"){
        src.administrador = true;
    }
    else{
        src.administrador = false;
    }
    var jstring=JSON.stringify(src);
    $.ajax({
                    async:true,
                    type:'POST',
                    contentType:'application/json',
                    url:'http://localhost:8080/ENCOM/API/Usuarios/RegistrarUsuario',
                    dataType:"json",
                    data:jstring,
                    success:function(data){
                        alert(data.Mensaje);
                        window.location="ConsultarUsuario.jsp";
                    },
                    error:function(xhr ,ajaxOptions, thrownError ){
                        alert(xhr.statusText);
                    }
                }
                );
        return false;
}
function obtenerUsuarios(){
        $.ajax({
            type: 'GET',
            url: 'http://localhost:8080/ENCOM/API/Usuarios/ObtenerDatosGenerales',
            dataType: "json",
            success: function(data){
                for(var profile in data.Usuarios){
                    var tr = document.createElement('tr');
                    var td1 = document.createElement('td');
                    var td2 = document.createElement('td');
                    var td3 = document.createElement('td');
                    var td4 = document.createElement('td');
                    var usr=data.Usuarios[profile]; 
                    var text1 = document.createTextNode(usr.Correo);
                    var text2 = document.createTextNode(usr.ID);
                    var text3 = document.createTextNode(usr.Nombre);
                    var text4 = document.createTextNode(usr.Direccion);
                    //HTML DOM
                    td1.appendChild(text1);
                    td2.appendChild(text2);
                    td3.appendChild(text3);
                    td4.appendChild(text4);
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    document.getElementById("tabla").appendChild(tr);
                }
            },
            error:function(xhr ,ajaxOptions, thrownError ){
                alert(xhr.statusText);
            }
        });
    return false;
}
function busquedaUsuario(){
    var src={};
    src.correo=jQuery("#idW").val();
    var jsonString=JSON.stringify(src);
    $.ajax({
        type: 'POST',
        contentType:'application/json',
        url: 'http://localhost:8080/ENCOM/API/Usuarios/ObtenerDatosPersonales',
        dataType: "json",
        data:jsonString,
        success: function(data){
            if(data.Busqueda==true)
            {
                var tr = document.createElement('tr');
                var td1 = document.createElement('td');
                var td2 = document.createElement('td');
                var td3 = document.createElement('td');
                var td4 = document.createElement('td');
                var td5 = document.createElement('td');
                var td6 = document.createElement('td');

                var text1 = document.createTextNode(data.Correo);
                var text2 = document.createTextNode(data.Password);
                var text3 = document.createTextNode(data.ID);
                var text4 = document.createTextNode(data.Nombre);
                var text5 = document.createTextNode(data.Direccion);
                var text6 = document.createTextNode(data.Administrador);

                td1.appendChild(text1);
                td2.appendChild(text2);
                td3.appendChild(text3);
                td4.appendChild(text4);
                td5.appendChild(text5);
                td6.appendChild(text6)
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);
                tr.appendChild(td6);

                document.getElementById("tabla").appendChild(tr);

                jQuery("#busqueda").hide();
                jQuery("#mostrar").show();
            }
            else{
                alert(data.Mensaje);
            }
        },
        error:function(xhr ,ajaxOptions, thrownError ){
                    alert(xhr.statusText);
        }
    });
    return false;
}
function busquedaUsuarioM(){
    var src={};
    src.correo=jQuery("#idWT").val();
    var jsonString=JSON.stringify(src);
    $.ajax({
        type: 'POST',
        contentType:'application/json',
        url: 'http://localhost:8080/ENCOM/API/Usuarios/ObtenerDatosPersonales',
        dataType: "json",
        data:jsonString,
        success: function(data){
            if(data.Busqueda==true)
            {
                jQuery("#correo").val(data.Correo);
                jQuery("#passwd").val(data.Password);
                jQuery("#idW").val(data.ID);
                jQuery("#nombre").val(data.Nombre);
                jQuery("#direccion").val(data.Direccion);
                if(data.Administrador==true){
                    jQuery("#typeusr").val("Permisos de administrador");
                }
                else{
                    jQuery("#typeusr").val("Permisos de usuario estandar");
                }
                $("#search").hide();
                $("#change").show();
            }
            else{
                alert(data.Mensaje);
            }
        },
        error:function(xhr ,ajaxOptions, thrownError ){
            alert(xhr.statusText);
        }
    });
    return false;
}
function updateUser(){
    if($("#passwddiv").attr("i")==1){
            alert("Revise los campos de password y confirmar password.");
            $("#passwd").focus();
            return false;
    }else if($("#numdiv").attr("i")==1){
            alert("Revise el campo de número de trabajador.");
            $("#idW").focus();
            return false;
    }else if($("#dirdiv").attr("i")==1){
            alert("Revise el campo de direccion.");
            $("#direccion").focus();
            return false;
    }
    var src={};
    src.correo=jQuery("#correo").val();
    src.password=jQuery("#passwd").val();
    src.id=jQuery("#idW").val();
    src.direccion=jQuery("#direccion").val();
    var datos=JSON.stringify(src);
    $.ajax({
        type:'PUT',
        contentType:'application/json',
        url:'http://localhost:8080/ENCOM/API/Usuarios/ModificarDatosUsuario',
        dataType:'json',
        data:datos,
        success: function(data){
            if(data.Arreglado==true){
                alert(data.Mensaje);
                window.location("ConsultarUsuario.jsp");
            }
            else{
                alert(data.Mensaje);
            }
        },
        error : function(xhr,ajaxOptions,thrownError){
            alert(xhr.statusText);
        }
    });
    return false;
}
function EliminarUsuario(){
    var x=confirm("Se eliminara permanentemente al usuario, sea administrador o profesor, ¿desea continuar?");
    if(x==true){
        var src={};
        src.correo=jQuery("#idW").val();
        var jsonString=JSON.stringify(src);

        $.ajax({
            type:'POST',
            contentType:'application/json',
            url:'http://localhost:8080/ENCOM/API/Usuarios/EliminarUsuario',
            dataType:'json',
            data:jsonString,
            success: function(data){
                if(data.Eliminado==true){
                    alert(data.Mensaje);
                    window.location("ConsultarUsuario.jsp");
                }else{
                    alert(data.Mensaje);
                }
            },
            error: function(xhr,ajaxOptions,thrownError){
                alert(xhr.statusText);
            }
        });
        return false;
    }
    else{
        return false;
    }
}

            
            