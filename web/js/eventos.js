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
    });
    $("input,textarea").blur(function() {
        var x = $(this).val();
        var element = $(this).parents("div.campo");
        AlertMessage_Display(element, false);
        $(this).parent().css("border", "1px solid rgba(128,128,128,.4)");
        $(this).parent().css("background-color", "rgba(128,128,128,.1)");
        if (x == "") {
            $(this).parent().animate({"backgroundColor": "rgba(255,0,0,.3)", "border": "1px solid rgba(255,0,0,.4)"}, "slow");
            AlertMessage(element, "empty", "El campo está vacio.", true);
        } else {
            $(this).parent().animate({"backgroundColor": "rgba(0,255,0,.3)", "border": "1px solid rgba(0,255,0,.4)"}, "slow");
            AlertMessage(element, "empty", "", false);
        }
    });
});

function AlertMessage(element, id, message, status) {
    if (status == true) {
        if (element.find(".alert").length == 0) {
            element.append("<div class='alert frst'></div><div class='alert message'></div>");
            element.find(".frst").css({
                "width": "30px",
                "height": "15px",
                "background-color": "rgba(255,0,0,.3)",
                "border": "1px solid rgba(128,128,128,.4)",
                "position": "absolute",
                "padding": "0px",
                "left": "515px",
                "top": "39px",
                "opacity": "0"
            });
            element.find(".message").css({
                "width": "200px",
                "height": "100px",
                "background-color": "rgba(255,0,0,.3)",
                "border": "1px solid rgba(128,128,128,.4)",
                "position": "absolute",
                "padding": "10px 0",
                "left": "560px",
                "top": "-1px",
                "overflow": "hidden",
                "opacity": "0"
            })
                    .append("<ul></ul>");
            element.find(".message ul").css({
                "list-style-image": "url(../images/red_cross.png)",
                "padding-left":"30px"
            });
            element.find(".alert").fadeTo("slow", "1");
        }
        if (element.find("li#" + id).length == 0) {
            element.find(".message ul").append("<li id='" + id + "'>" + message + "</li>");
        }
    } else {
        if (element.find(".message li#"+id).length != 0) {
            element.find("li#"+id).remove();
            if(element.find(".message li").length==0){
                element.find(".alert").fadeTo("fast","0",function(){element.find(".alert").remove();});                
            }
        }
    }
}

function AlertMessage_Display(element, status) {
    if (status == true) {
        if (element.find(".alert") != 0) {
            element.find(".message").fadeTo(300, "0", function() {
                element.find(".alert").css({
                    "border": "1px solid rgba(0,0,255,.4)",
                    "background-color": "rgba(0,0,255,.3)"
                });
                $(this).css("height", "auto").fadeTo(300, "1");
            });

        }
    } else {
        if (element.find(".alert") != 0) {
            element.find(".message").fadeTo(300, "0", function() {
                element.find(".alert").css({
                    "border": "1px solid rgba(128,128,128,.4)",
                    "background-color": "rgba(255,0,0,.3)"
                });
                $(this).css("height", "100px").fadeTo(300, "1");
            });
        }
    }
}