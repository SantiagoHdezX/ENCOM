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
        $(".campo .alert").fadeTo("slow", 0, function() {
            $(this).remove();
        });
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
    $("#idMat").blur(function() {
        var element = $(this).parents("div.campo");
        if ($(this).val() != "") {
            if ($(this).val() < 1 || $(this).val() > 9999) {
                AlertMessage(element, "idOut", "El rango para id es entre 1-9999", true);
            } else {
                AlertMessage(element, "idOut", "", false);
            }
        }
    });
    $("#semestre").blur(function() {
        var element = $(this).parents("div.campo");
        if ($(this).val() != "") {
            if ($(this).val() < 3 || $(this).val() > 6) {
                AlertMessage(element, "semOut", "Solo puedes registrar materias de 3° a 6° semestre.", true);
            } else {
                AlertMessage(element, "semOut", "", false);
            }
        }
    });
    $("#semestre[ajax='true']").change(function() {
        if($(this).val()!=""){
            var sourceInfo = {};
            sourceInfo.semestre = jQuery(this).val();
            var jsonString = JSON.stringify(sourceInfo);
            $.ajax({
                async: true,
                contentType: 'application/json',
                type: 'POST',
                datatype: 'json',
                url: 'http://localhost:8080/ENCOM/API/Horarios/ObtenerMaterias',
                data: jsonString,
                success: function(data) {
                    $("#listaMaterias").empty();
                    if(data.Exito==false){
                        $("#listaMaterias").append("<option id='no'>No hay materias registradas.</option>");
                    } else{                        
                        $("#listaMaterias #no").remove();
                        $("#listaMaterias").removeAttr("disabled");
                        for (var materias in data.Materias) {
                            var mat = data.Materias[materias];
                            var tr = {};
                            tr.Id = mat.ID;
                            tr.No = mat.Nombre;
                            $("#listaMaterias").append("<option value='" + tr.Id + "'>" + tr.No + "</option>");
                        }
                        $("#listaMaterias option").last().remove();
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(xhr.statusText);
                }
            });
            $.ajax({
                async: true,
                contentType: 'application/json',
                type: 'POST',
                datatype: 'json',
                url: 'http://localhost:8080/ENCOM/API/Horarios/ObtenerGrupos',
                data: jsonString,
                success: function(data) {
                    $("#listaGrupos").empty();
                    if(data.Busqueda==false){
                        $("#listaGrupos").append("<option id='no'>No hay grupos registradas.</option>");
                    } else{                        
                        $("#listaGrupos #no").remove();
                        $("#listaGrupos").removeAttr("disabled");
                        for (var grupo in data.Grupos) {
                            var grup = data.Grupos[grupo];
                            var tr = {};
                            tr.Id = grup.NID;
                            tr.No = grup.ID;
                            $("#listaGrupos").append("<option value='" + tr.Id + "'>" + tr.No + "</option>");
                        }
                        $("#listaGrupos option").last().remove();
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(xhr.statusText);
                }
            });
        }
    });
});
/*
 $(document).ready(function() {
 $("#materia").click(function() {
 $("#ResMateria").fadeIn("fast");
 $("#ResHorario").fadeOut("fast");
 });
 $("#horario").click(function() {
 $("#ResMateria").fadeOut("fast");
 $("#ResHorario").fadeIn("fast");
 $.ajax({
 type: 'GET',
 url: 'http://localhost:8080/ENCOM/API/Horarios/ObtenerMaterias',
 dataType: "json",
 success: function(data) {
 for (var horarios in data.Horarios) {
 var hor = data.Horarios[horarios];
 var tr = {};
 tr.Id = hor.ID;
 tr.No = hor.Nombre;
 $("#listaMaterias").append("<option value=" + tr.Id + ">" + tr.No + "</option>");
 }
 },
 error: function(xhr, ajaxOptions, thrownError) {
 alert(xhr.statusText);
 }
 });
 $.ajax({
 type: 'GET',
 url: 'http://localhost:8080/ENCOM/API/Horarios/ObtenerGrupos',
 dataType: "json",
 success: function(data) {
 for (var horarios in data.Horarios) {
 var hor = data.Horarios[horarios];
 var tr = {};
 tr.Id = hor.NID;
 tr.No = hor.ID;
 $("#listaGrupos").append("<option value=" + tr.Id + ">" + tr.No + "</option>");
 }
 },
 error: function(xhr, ajaxOptions, thrownError) {
 alert(xhr.statusText);
 }
 });
 });
 }); */

