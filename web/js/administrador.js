$(document).ready(function(){
    
	$("#news-access").click(function(){
		$("#news-mostrar").fadeToggle(500);
	});
        
        $("div.session").append("<span id='session'>Sesion Activa: "+localStorage.getItem("Nombre").toString()+"</span>")
        .css("padding-top",($("div.session").height()/2-$("#session").height()/2).toString()+"px");

        
        $(".m1").click(function(){
            $(".ex:not(.m1)").fadeOut(250);
            setTimeout(function(){$(".m1").fadeIn(250);},250);
        });
        
        $(".m2").click(function(){
            $(".ex:not(.m2)").fadeOut(250);
            setTimeout(function(){$(".m2").fadeIn(250);},250);
        });
        
        $(".m3").click(function(){
            $(".ex:not(.m3)").fadeOut(250);
            setTimeout(function(){$(".m3").fadeIn(250);},250);
        });
        
        $(".m4").click(function(){
            $(".ex:not(.m4)").fadeOut(250);
            setTimeout(function(){$(".m4").fadeIn(250);},250);
        });
});