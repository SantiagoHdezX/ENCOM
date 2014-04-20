$(document).ready(function(){
				$("input").focus(function(){
					$(this).parent().css({
						"border":"1px solid rgba(0,0,255,.4)",
						"background-color":"rgba(0,0,255,.3)"});
				  });
				  $("input").blur(function(){
					$(this).parent().css("border","1px solid rgba(128,128,128,.4)");
					$(this).parent().css("background-color","rgba(128,128,128,.1)");
				  });
			
				$("#correo").blur(function(){
					var x=$(this).val();
					var atpos=x.indexOf("@");
					var dotpos=x.lastIndexOf(".");
					if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
					{
						$("#errorescorreo").remove();
						$(this).after("<ul id=errorescorreo><b><br><li>Debe llevar @ y por lo menos un punto.</li></b></ul>");
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
					}
					else{
						$("#errorescorreo").remove();
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow").attr("i","0");
					}
				});
				
				$("#passwd, #cpasswd").blur(function(){
					var y=$("#passwd").val();
					var x=$("#cpasswd").val();
					if(x!="" && y!=""){
						if (x==y){
							$("#errorespass").remove();
							$("#cpasswd").after("<ul id=errorespass><b><br><li>Las contraseñas coinciden.</li></b></ul>");
							$("#cpasswd").parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow");
							$("#passwd").parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow").attr("i","0");
						}
						else{
							$("#errorespass").remove();
							$("#cpasswd").after("<ul id=errorespass><b><br><li>Las contraseñas NO coinciden.</li></b></ul>");
							$("#cpasswd").parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow");
							$("#passwd").parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
						}
					}
					else{
						$("#errorespass").remove();
						$("#cpasswd").after("<ul id=errorespass><b><br><li>No deben estar en blanco los campos de contraseñas.</li></b></ul>");
						$("#cpasswd").parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow");
						$("#passwd").parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
					}
				});
				$("#idW").blur(function(){
					var x=$(this).val();
					if (x<=0)
					{
						$("#erroresnum").remove();
						$(this).after("<ul id=erroresnum><b><br><li>No es un número de trabajador válido.</li></b></ul>");
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
					}
					else{
						$("#erroresnum").remove();
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow").attr("i","0");
					}
				});
				$("#nombre").blur(function(){
					if($(this).val()==""){
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
					}
					else{
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow").attr("i","0");
					}
				});
				$("#direccion").blur(function(){
					if($(this).val()==""){
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow").attr("i","1");
					}
					else{
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow").attr("i","0");
					}
				});
				$("#idWT").blur(function(){
					var x=$(this).val();
					var atpos=x.indexOf("@");
					var dotpos=x.lastIndexOf(".");
					if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
					{
						$(this).parent().animate({"backgroundColor":"rgba(255,0,0,.3)","border":"1px solid rgba(255,0,0,.4)"},"slow");
					}
					else{
						$(this).parent().animate({"backgroundColor":"rgba(0,255,0,.3)","border":"1px solid rgba(0,255,0,.4)"},"slow");
					}
				});
			});