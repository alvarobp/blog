--- 
wordpress_id: 10
layout: post
title: Paquetes en Debian (algunas utilidades)
wordpress_url: http://localhost/blog/?p=10
---
Existen una serie de opciones en los comandos típicos de gestión de paquetes de Debian que son bastante útiles y/o curiosas, que quizá se desconocen (o yo por lo menos desconocía o no las había usado). Algunos de estos usos de los comandos son:

<code>dpkg --get-selections &gt; fichero.txt</code>

Nos da una lista del estado de todos los paquetes de nuestro sistema. Otra forma de obtenerlo es mediante <code>dpkg -l &gt; fichero.txt</code> que nos da ademas la version del paquete y la descripción. Este último se puede usar también para saber si tenemos un paquete instalado (<code>dpkg -l &lt;paquete&gt;</code>)

<code>dpkg --audit</code>

Nos muestra los paquetes  que se han quedado a medio instalar o en los que halla fallado la configuración, y los que tengan cualquier estado de error.

<code>aptitude hold | unhold &lt;paquete&gt;</code>

Para bloquear o desbloquear la actualización de un paquete.

<code>aptitude -f --with-recommends dist-upgrade</code>

Se realizará una actualización completa del sistema, esto es, se instalarán las versiones más recientes de los paquetes y se resolverán todos los posibles cambios de dependencias entre los paquetes de diferentes versiones. Si fuera necesario, se instalarían paquetes nuevos (normalmente, versiones nuevas de las bibliotecas o paquetes que han cambiado de nombre), y se eliminarían los paquetes obsoletos conflictivos.

Se puede utilizar aptitude facilmente (con comandos de consola) para instalar desinstalar programas, actualizar el sistema... de la misma manera que apt-get (claro que aptitude es un front-end de este), por ejemplo "<code>aptitude install libncurses5-dev</code>" , "<code>aptitude purge libncurses5-dev</code>".  Aun más fácil es usarlo con su interfaz.

Seguro que además de estas pocas hay muchísimas que desconozco (seguro que muchos también) y que si leemos atentamente los man seguro que las encontramos.

