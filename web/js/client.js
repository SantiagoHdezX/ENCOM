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
            $("#nombre").focus();
            return false;
    }else if($("#fecha").val()==""){
            $("#fecha").focus();
            return false;
    }else if($("#hora").val()==""){
            $("#hora").focus();
            return false;
    }else if($("#descripcion").val()==""){
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
                    $("#Ev_Con").click();
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
                var evts=data.Eventos[evento];
                var tr={};
                tr.tdId="<td>"+evts.ID_Evento+"</td>";
                tr.tdNo="<td>"+evts.Nombre+"</td>";
                tr.tdDe="<td>"+evts.Descripcion+"</td>";
                tr.tdFe="<td>"+evts.Fecha+"</td>";
                tr.tdHo="<td>"+evts.Hora+"</td>";
                tr.tdDu="<td>"+evts.Duracion+"</td>";
                $("#tabla").append("<tr>"+tr.tdId+tr.tdNo+tr.tdDe+tr.tdFe+tr.tdHo+tr.tdDu+"</tr>");                
            }            
            $("#tabla tr").last().empty();
            $("#tabla").css("margin-bottom","0px");
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
                jQuery("#busqueda").fadeOut("fast");
                jQuery("#modificar").fadeIn("fast");
                $("#modificar form").prepend("<input type='hidden' id='id' value='"+data.Id+"'/>");
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
    sourceInfo.Id=jQuery("#id").val();
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
                    $("#Ev_Con").click();
                },
                error:function(xhr ,ajaxOptions, thrownError ){
                    alert(xhr.statusText);
                }
            }
            );
    return false;
}
function CaducarEvento(){
    if($("#nombre").val()==""){        
        alert("Ingrese un nombre en el campo."); 
        $("#nombre").focus();
        return false;
    }
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
                    $("#Ev_Con").click();
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
                for(var usuario in data.Usuarios){
                var users=data.Usuarios[usuario];
                var tr={};
                var admin=(users.Administrador==1)?"Si":"No";
                tr.tdCo="<td>"+users.Correo+"</td>";
                tr.tdId="<td>"+users.ID+"</td>";
                tr.tdNo="<td>"+users.Nombre+"</td>";
                tr.tdDi="<td>"+users.Direccion+"</td>";
                tr.tdAd="<td>"+admin+"</td>";
                $("#tabla").append("<tr>"+tr.tdNo+tr.tdId+tr.tdCo+tr.tdDi+tr.tdAd+"</tr>");                
            }            
            $("#tabla tr").last().empty();
            $("#tabla").css("margin-bottom","0px");
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
                var admin=(data.Administrador==1)?"Si":"No";
                tr.tdCo="<td>"+data.Correo+"</td>";
                tr.tdId="<td>"+data.ID+"</td>";
                tr.tdNo="<td>"+data.Nombre+"</td>";
                tr.tdDi="<td>"+data.Direccion+"</td>";
                tr.trPa="<td>"+data.Password+"</td>";
                tr.tdAd="<td>"+admin+"</td>";
                $("#tabla").append("<tr>"+tr.tdId+tr.tdNo+tr.tdCo+tr.tdDi+tr.tdPa+tr.tdAd+"</tr>"); 

                jQuery("#busqueda").fadeOut("fast");
                jQuery("#mostrar").fadeIn("fast");
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
                $("#search").fadeOut("fast");
                $("#change").fadeIn("fast");
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

            
            