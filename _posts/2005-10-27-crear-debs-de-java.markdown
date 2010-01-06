--- 
wordpress_id: 18
layout: post
title: Crear debs de Java
wordpress_url: http://localhost/blog/?p=18
---
Existe una forma cómoda, fácil y rápida de tener java (ya sea jre o jsdk) en un deb, mediante el paquete java-package de debian. Los pasos son los siguientes:
<ol><li>Instalar <i>java-package</i> (apt-get install java-package)</li>
<li>Bajar de la web de sun el jsdk por ejemplo el <a href="http://java.sun.com/j2se/1.5.0/download.jsp">jdk 5.0</a></li>
<li>Ejecutar <i>make-jpkg jdk-1_5_0-linux-i586.bin</i> (lo que nos generará el .deb)</li>
</ol>
Ahora ya podremos hacer <i>dpkg -i sun-j2sdk1.5_1.5.0_i386.deb</i> , lo que nos instalará el entorno  en /usr/lib/j2sdk1.5-sun.
