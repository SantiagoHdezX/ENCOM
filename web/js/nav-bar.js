    /* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){   
       
       function barWidth(num){
            var suma=0;
            for(var j=0; j<($(".scnd-menu-options").eq(num).find("li").length); j++){
                var tmp = $(".scnd-menu-options").eq(num).find("li").eq(j);
                suma+=tmp.outerWidth();
            }
            $(".scnd-menu-options").eq(num).parent().width(suma+20);
       }
        
        $(".main .m1").click(function(){
            if($(".li1 .ex").eq(0).css("display")=="block"){
                $(".li1 .ex, .ex").fadeOut(250);
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
            } else{
                $(".ex:not(.m1)").fadeOut(250);  
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
                setTimeout(function(){
                    $(".m1, .bottomln").fadeIn(250); barWidth(0);$(".scnd-menu-image").addClass("ch-img-1");},250);
                
            }
            $(".scnd-menu-options li").removeClass("click").css("background-color","rgba(0,0,0,0)");
        });
        
        $(".main .m2").click(function(){
            if($(".li2 .ex").eq(0).css("display")=="block"){
                $(".li2 .ex, .ex").fadeOut(250);
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
            } else{
                $(".ex:not(.m2)").fadeOut(250); 
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
                setTimeout(function(){
                    $(".m2, .bottomln").fadeIn(250); barWidth(1);$(".scnd-menu-image").addClass("ch-img-2");},250);               
            }
            $(".scnd-menu-options li").removeClass("click").css("background-color","rgba(0,0,0,0)");
        });
        
        $(".main .m3").click(function(){
            if($(".li3 .ex").eq(0).css("display")=="block"){
                $(".li3 .ex, .ex").fadeOut(250);
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
            } else{
                $(".ex:not(.m3)").fadeOut(250); 
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
                setTimeout(function(){
                    $(".m3, .bottomln").fadeIn(250); barWidth(2);$(".scnd-menu-image").addClass("ch-img-3");},250);               
            }
            $(".scnd-menu-options li").removeClass("click").css("background-color","rgba(0,0,0,0)");
        });
        
        $(".main .m4").click(function(){
            if($(".li4 .ex").eq(0).css("display")=="block"){
                $(".li4 .ex, .ex").fadeOut(250);
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
            } else{
                $(".ex:not(.m4)").fadeOut(250);   
                $(".scnd-menu-image").removeAttr("class").addClass("scnd-menu-image");
                setTimeout(function(){
                    $(".m4, .bottomln").fadeIn(250); barWidth(3);$(".scnd-menu-image").addClass("ch-img-4");},250);               
            }
            $(".scnd-menu-options li").removeClass("click").css("background-color","rgba(0,0,0,0)");
        });
        
        $(".scnd-menu-options li").not(".scnd-menu-options li:last-child").css("border-right","1px solid gray");
        $(".scnd-menu-options li").mouseover(function(){
            if($(this).filter(".click").length==0){
                $(this).css("backgroundColor","rgba(255,255,255,.3)");
            }   
        }).mouseout(function(){
            if($(this).filter(".click").length==0){
                $(this).css("backgroundColor","rgba(0,0,0,0)");
            }
        }).click(function(){
                $("li").not(this).animate({"backgroundColor":"rgba(0,0,0,0)"},150).removeClass("click");
                $(this).animate({"backgroundColor":"rgba(255,255,255,.7)"},150); 
                $(this).addClass("click");
        });       ;
});
