$(document).ready(function() {
    $("input,textarea").css({
        "border-radius": "5px",
        "border": "solid 1px rgb(169,169,169)"
    });
    $("input,textarea").not("input[type='button'],input[type='date']").css("padding", "5px 5px");
    $("input[type='text'],input[type='password']").css("width", "300px");
    $("input[type='button'],button").css("width", "150px");
    $("div.campo").css("position", "relative");
    $("textarea").css({
        "width": "300px",
        "height": "100px",
        "resize": "none",
        "overflow-y": "auto"
    });
    $("input[type='date']").css("padding", "0 5px");
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
    
    //validacion fecha
    $("#fecha").change(function(){
        var fecha_temp = $(this).val().split("-");
        var element = $(this).parents("div.campo");
        var element_hora = $("#hora").parents("div.campo");
        var fecha = new Date(fecha_temp[0],fecha_temp[1]-1,fecha_temp[2]);
        var hoy = new Date();
        if(fecha.getFullYear()==hoy.getFullYear()&&fecha.getMonth()==hoy.getMonth()&&fecha.getDate()==hoy.getDate()){
            var hora_temp = $("#hora").val();            
            if(hora_temp!=""){
                var hora = hora_temp.split(":");
                if(hora[0]<=hoy.getHours()){
                    AlertMessage(element_hora, "time", "Debe ingresar una hora futura.", true);
                } else{
                    AlertMessage(element_hora, "time", "", false);
                }
            }
            AlertMessage(element, "date", "", false);            
        }else{
            if($("#hora").val()!=""){
                AlertMessage(element_hora, "time", "", false);
            }
            if(fecha<hoy){
                AlertMessage(element, "date", "Debe ingresar una fecha futura.", true);
            } else{    
                AlertMessage(element, "date", "", false);
            }
        }
    });
    
    //validacion hora
    $("#hora").change(function(){
        var comp = $("#fecha").val();
        if(comp!=""){
            var fecha_temp = $("#fecha").val().split("-");
            var element = $(this).parents("div.campo");
            var fecha = new Date(fecha_temp[0],fecha_temp[1]-1,fecha_temp[2]);
            var hoy = new Date();
            if(fecha.getFullYear()==hoy.getFullYear()&&fecha.getMonth()==hoy.getMonth()&&fecha.getDate()==hoy.getDate()){
                var hora_temp = $("#hora").val();
                var hora = hora_temp.split(":");
                if(hora[0]<=hoy.getHours()){
                    AlertMessage(element, "time", "Debe ingresar una hora futura.", true);
                } else{
                    AlertMessage(element, "time", "", false);
                }            
            }
        }
    });
    
});