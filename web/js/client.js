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
                                window.location="menuAdministrador.jsp";
                            }
                            else{
                                localStorage.setItem("Sesion",true);
                                localStorage.setItem("Admin",false);
                                window.location="menuUsuario.jsp";
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
function verificarSesionMenu(){
    if(JSON.parse(localStorage.getItem("Sesion"))==true){
        if(JSON.parse(localStorage.getItem("Admin"))==true){
            document.write("<p>Bienvenido, usuario administrador</p>");
        }
        else{
            document.write("<p>Bienvenido, usuario profesor </p>")
        }
    }
    else{
        alert("No tienes acceso a esta pagina");
        window.location="index.jsp";
    }
}