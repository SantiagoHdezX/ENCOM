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
   
//navbar funcionalidad inicio
    
    $(".ch-item").click(function(){
        path1=$(this).find("h3").text();
    });
    
    $(".scnd-menu li").click(function(){        
        path2=$(this).text().replace(" ","");
        url="http://localhost:8080/ENCOM/Administrador/"+path1+"/"+path2+".jsp";
        $.ajax({
            async:true,
            url: url,
            success:function(data){
                $(".cont-box").html(data);
                $("input,textarea").focus(function(){
			$(body).parent().css({
				"border":"1px solid rgba(0,0,255,.4)",
				"background-color":"rgba(0,0,255,.3)"});
		  });
		  $("input,textarea").blur(function(){
			var x=$(this).val();
			$(this).parent().css("border","1px solid rgba(128,128,128,.4)");
			$(this).parent().css("background-color","rgba(128,128,128,.1)");
			if(x==""){
				$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow");
			}else{
				$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow");
			}
		  });

            }
        });
    });
});

//navbar funcionalidad fin

function ShowEventos(){
    $("#eventos").show();
    $("#usuarios").hide();
}
function ShowUsuarios(){
    $("#eventos").hide();
    $("#usuarios").show();
}