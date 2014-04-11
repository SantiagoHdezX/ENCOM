$("head").prepend("<link href='../images/icons/profesor.ico' rel='shortcut icon' type='image/x-ico'>");

if(localStorage.getItem("Sesion")!=null){
            if(localStorage.getItem("Admin").toString()=="true"){
                window.location.href="../";
            }
} else{
    window.location.href="../";
}
                        
$(function(){
    obtenerEventos();
    $("#news-access").click(function(){
		$("#news-mostrar").fadeToggle(500);
	});        
});