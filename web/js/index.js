if(localStorage.getItem("Sesion")!==null){
    if(localStorage.getItem("Admin").toString()=="true"){
        window.location.href="Administrador/";
    }
    else{
        window.location.href="Profesor/";
    }
}
            
$(document).ready(function(){
   $("#rdProf").click(function(){
       $(".sesion-image-admin").fadeOut("fast",function(){
            $(".sesion-image-prof").fadeIn("fast");
       });
   });
  $("#rdAdmin").click(function(){
       $(".sesion-image-prof").fadeOut("fast",function(){
            $(".sesion-image-admin").fadeIn("fast");
       });
  });
});

