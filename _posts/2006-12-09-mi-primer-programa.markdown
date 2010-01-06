--- 
wordpress_id: 37
layout: post
title: Mi primer programa
wordpress_url: http://blog.inbatu.com/2006/12/09/mi-primer-programa/
---
En septiembre comencé a desarrollar una sencilla aplicación de gestión de almacén para el gabinete de estética de mi prima. En un principio pensé en hacerlo en Java, pues era el lenguaje que estudié el año pasado. Pero el desarrollo de interfaces gráficas para este lenguaje no me resultaba demasiado cómodo. Así que decidí hacerlo con C++ utilizando Qt, retomando así un lenguaje y una librería que se me habían quedado un poco pendientes.

El programa en sí es bastante sencillo (de momento), estará lleno de bugs, mal diseñado... también hay que tener en cuenta que es lo primero más o menos serio que hago en el campo de la programación.

Como ya he dicho utilizo Qt (4.2) no solo para las interfaces sino en general. Utilizo las estructuras de datos que vienen con la librería, las clases de acceso a bases de datos... SQLite fue mi elección ya que como no va a ser una base de datos de tamaño excesivo pensé que estaría bien, además para las copias de seguridad basta con copiar el fichero de la base de datos a un lugar seguro.

En fin, que ya tengo digamos una primera versión utilizable del programa, aunque no funciona como me gustaría si que por lo menos "funciona". La gestión de productos es un poco tediosa y tal. Pero bueno para empezar ya se puede manejar toda la información que creemos que es necesaria.

El código del programa se puede obtener mediante subversion:

Para la versión en desarrollo:
<pre>svn co http://svn.inbatu.com/almacen/trunk almacen</pre>

Para la primera versión que he considerado "estable" (más bien funcional):
<pre>svn co http://svn.inbatu.com/almacen/branches/almacen-0.5</pre>

Bueno y unas capturas de pantalla (un poco feas):

<table><tr><td><a href="/drawer/2006/12/almacen-05_principal.png"><img src="/drawer/2006/12/almacen-05_principal.miniatura.png" title="{almacen} Ventana principal" alt="vprincipal" /></a></td><td><a href="/drawer/2006/12/almacen-05_entrada.png"><img title="{almacen} Entrada" id="image40" src="/drawer/2006/12/almacen-05_entrada.miniatura.png" alt="Almacen 0.5 - Ventana entrada de producto" /></a></td><td><a href="/drawer/2006/12/almacen-05_nuevo.png"><img title="{almacen} Nuevo" id="image39" src="/drawer/2006/12/almacen-05_nuevo.miniatura.png" alt="Almacen 0.5 - Ventana nuevo producto" /></a></td></tr></table>
Ejem, quizá falte maquear un poco más las cosas. El pedazo de hueco blanco de la ventana principal es un textarea que puse para rellenar, más adelante quiero poner una lista de albaranes en su lugar.
