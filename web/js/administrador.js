$("head").prepend("<link href='../images/icons/administrador.ico' rel='shortcut icon' type='image/x-ico'>");

if(localStorage.getItem("Sesion")!=null){
     if(localStorage.getItem("Admin").toString()=="false"){
         window.location.href="../";
     }
 } else{
     window.location.href="../";
 }
 
var path1,path2,url,callback;

$(function(){
   $("#eventos").hide();
   $("#usuarios").hide();
   
//navbar funcionalidad
    
    $(".ch-item").click(function(){
        path1=$(this).find("h3").text();
    });
    
    $(".scnd-menu li").click(function(){        
        path2=$(this).text().replace(" ","");
        path2=(path1=="Usuarios"&&path2=="ConsultaIndividual")?"ConsultaUsuario":path2;
        path2=(path1=="Usuarios"&&path2=="ConsultaGeneral")?"ConsultarUsuario":path2;
        url="http://localhost:8080/ENCOM/Administrador/"+path1+"/"+path2+".jsp";
        $.ajax({
            async:true,
            url: url,
            success:function(data){              
                $(".cont-box").html(data);                
            }
        });
    });
});

//navbar funcionalidad

function ShowEventos(){
    $("#eventos").show();
    $("#usuarios").hide();
}
function ShowUsuarios(){
    $("#eventos").hide();
    $("#usuarios").show();
}