$(document).ready(function() {
     $("input,textarea").css({
        "border-radius":"5px",
        "border": "solid 1px rgb(169,169,169)"
    });
    $("input,textarea").not("input[type='button'],input[type='date']").css("padding","5px 5px");
    $("input[type='text'],input[type='password'],input[type='email']").css("width","300px");
    $("input[type='button'],button").css("width","150px");
    $("div.campo").css("position", "relative");
    $("textarea").css({
       "width":"300px",
       "height":"100px",
       "resize":"none",
       "overflow-y": "auto" 
    });
    
    $("input,textarea").focus(function() {
        var element = $(this).parents("div.campo");
        $(this).parent().css({
            "border": "1px solid rgba(0,0,255,.4)",
            "background-color": "rgba(0,0,255,.3)"
        });
        AlertMessage_Display(element, true);
    });
    $("button[type='reset']").click(function() {
        $("input,textarea").parent().animate({"backgroundColor": "rgba(128,128,128,.1)", "border": "1px solid rgba(128,128,128,.4)"}, "slow");
        $(".campo .alert").fadeTo("slow",0,function(){$(this).remove();});
    });
    $("input,textarea").blur(function() {
        var x = $(this).val();
        var element = $(this).parents("div.campo");
        AlertMessage_Display(element, false);
        $(this).parent().css("border", "1px solid rgba(128,128,128,.4)");
        $(this).parent().css("background-color", "rgba(128,128,128,.1)");
        if (x == "") {            
            AlertMessage(element, "empty", "El campo está vacio.", true);
        } else {            
            AlertMessage(element, "empty", "", false);
        }
    });

    $("#correo, #idWT").blur(function() {
        var x = $(this).val();
        if(x!=""){
            var element = $(this).parents("div.campo");
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length){
                AlertMessage(element, "mail", "No es un e-mail válido", true);
            }
            else {
                AlertMessage(element, "mail", "", false);
            }
        }
    });

    $("#passwd, #cpasswd").blur(function() {
        var y = $("#passwd").val();
        var element_pa = $("#passwd").parents("div.campo");
        var x = $("#cpasswd").val();
        var element_conf = $("#cpasswd").parents("div.campo");
        if (x != "" && y != "") {
            AlertMessage(element_conf, "pass_em", "", false);
            if (x == y) {
                AlertMessage(element_pa, "pass_co", "", false);
                AlertMessage(element_conf, "pass_co", "", false);
            }
            else {
                AlertMessage(element_conf, "pass_co", "La contraseña no coincide", true);
            }
        } else{
            AlertMessage(element_conf, "pass_em", "La contraseña no coincide", true);
        }
    });
    $("#idW").blur(function() {
        var x = $(this).val();
        var element = $(this).parents("div.campo");
        if(x!=""){
            if (x <= 0)
            {
                AlertMessage(element, "num", "No es un numero valido", true);
            }
            else {
                AlertMessage(element, "num", "", false);
            }
        }
    });
});