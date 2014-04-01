HYENIX
===========

Descripcion
-----------
Proyecto de registro de asistencia, retardos, faltas, solicitud de dias economicos, entre otros, para el CECyT 9 Juan de Dios Batiz


Descargar
----------
Descargar el proyecto como ZIP, cambiar el nombre de la carpeta de ENCOM-master a ENCOM

"Instalacion"
------------

Solo hay que abrir el proyecto en NetBeans y restaurar la base de datos

Si por alguna razon, el proyecto no abre, agregar carpeta WEB-INF a "Web Pages"

Tecnologia
-------------------
Representational State Transfer (REST)
JavaScript Object Notation (JSON)
WebSockets(en un futuro)
Asynchronous JavaScript And XML (AJAX)
Relational Database (MySQL)

"Librerias que utiliza"
----------------------
        -Del lado del cliente:
            -jQuery
            -Backbone.js (en un futuro)
        -Del lado del Server.
            -org.json
            -Maven(en un futuro)
            -MySQL JDBC

Servidor
-----------------------
Necesita usar GlassFish 4, Red Hat JBoss o WildFly (No funciona en Tomcat 7, por alguna razón)

"Como se consume el web service?"
---------------------------------
El Web Service  genera archivos JSON que deben ser interpretados por la aplicacion cliente.

En el caso de nuestra implementacion, jQuery hace una peticion AJAX y recibe el JSON como un objeto JavaScript

Herramientas
------------------
NetBeans 7.X
RESTClient

Modulos
------------------
	-Usuarios
		TERMINADO
	-Eventos
		TERMINADO
	-Incidencias
		-Terminado:Nada
		-Falta:API REST, cliente JavaScript
	-Horarios
		-Terminado:Nada
		-Falta:API REST y cliente JavaScript
	-Chat
		-Terminado:Nada
		-Falta:Servidor y cliente Node.js o Java.WebSockets (Java EE 7)
