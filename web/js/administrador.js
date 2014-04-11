$("head").prepend("<link href='../images/icons/administrador.ico' rel='shortcut icon' type='image/x-ico'>");

if(localStorage.getItem("Sesion")!=null){
     if(localStorage.getItem("Admin").toString()=="false"){
         window.location.href="../";
     }
 } else{
     window.location.href="../";
 }

$(function(){
   $("#eventos").hide();
   $("#usuarios").hide();
});

function ShowEventos(){
    $("#eventos").show();
    $("#usuarios").hide();
}
function ShowUsuarios(){
    $("#eventos").hide();
    $("#usuarios").show();
}