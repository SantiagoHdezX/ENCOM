$(document).ready(function() {
    $("input,textarea").css({
        "border-radius":"5px",
        "border": "solid 1px rgb(169,169,169)"
    });
     $("input,textarea").not("input[type='button']").css({
       "padding":"5px 5px" 
    });
    $("input,textarea").focus(function() {
        $(this).parent().css({
            "border": "1px solid rgba(0,0,255,.4)",
            "background-color": "rgba(0,0,255,.3)"});
    });
    $("input,textarea").blur(function() {
        var x = $(this).val();
        $(this).parent().css("border", "1px solid rgba(128,128,128,.4)");
        $(this).parent().css("background-color", "rgba(128,128,128,.1)");
        if (x == "") {
            $(this).parent().animate({"backgroundColor": "rgba(255,0,0,.3)", "border": "1px solid rgba(255,0,0,.4)"}, "slow");
        } else {
            $(this).parent().animate({"backgroundColor": "rgba(0,255,0,.3)", "border": "1px solid rgba(0,255,0,.4)"}, "slow");
        }
    });
});