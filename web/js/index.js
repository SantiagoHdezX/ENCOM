/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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

