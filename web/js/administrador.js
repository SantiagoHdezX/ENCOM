$("head").prepend("<link href='../images/icons/administrador.ico' rel='shortcut icon' type='image/x-ico'>");

if(localStorage.getItem("Sesion")!=null){
     if(localStorage.getItem("Admin").toString()=="false"){
         window.location.href="../";
     }
 } else{
     window.location.href="../";
 }
 
var path1,path2,url;

$(function(){  
    
   
//navbar funcionalidad
    
    $(".ch-item").click(function(){
        path1=$(this).find("h3").text();
        var hash_temp = document.location.hash;
        if(hash_temp!=""&&hash_temp!=("#"+path1)){                    
            var i = hash_temp.indexOf("&");
            hash_temp = hash_temp.substr(0,i);            
        }        
        document.location.hash=(hash_temp==("#"+path1))?"Index":path1;
        if(document.location.hash=="#Index"){
            UrlHash();
        }
    });
    
    $(".scnd-menu li").click(function(){        
        path2=$(this).text().replace(" ","");
        path2=(path1=="Usuarios"&&path2=="ConsultaIndividual")?"ConsultaUsuario":path2;
        path2=(path1=="Usuarios"&&path2=="ConsultaGeneral")?"ConsultarUsuario":path2;
        url="http://localhost:8080/ENCOM/Administrador/"+path1+"/"+path2+".jsp";
        document.location.hash=path1+"&"+$(this).attr("id");
        $.ajax({
            async:true,
            url: url,
            success:function(data){              
                $(".cont-box").html(data);                
            }
        });
    });
    
//navbar funcionalidad
    
//url-hash ajax

UrlHash();
    
//url-hash ajax

});

function UrlHash(){
    var hash_temp = document.location.hash;
    var ajax1= "", ajax2="";
    if(hash_temp=="#Index" || hash_temp==""){
        $.ajax({
            async:true,
            url: "http://localhost:8080/ENCOM/Administrador/index_ajax.jsp",
            success:function(data){              
                $(".cont-box").html(data);                
            }
        });
    } else if(hash_temp!=""){
        var i = hash_temp.indexOf("&");        
        ajax1 = (i!=-1)?hash_temp.substr(1,(i-1)):hash_temp.substr(1);
        $("h3:contains('"+ajax1+"')").parents("div.ch-item").click();
        if(i!=-1){
            ajax2=hash_temp.substr(i+1);
            $("li[id='"+ajax2+"']").click();
        }
    }
    
}