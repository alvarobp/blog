--- 
wordpress_id: 19
layout: post
title: "Creación de paquetes"
wordpress_url: http://localhost/blog/?p=19
---
Hoy he descubierto un programa bastante interesante para generar paquetes para las distribuciones más usadas, entre ellas como no Debian. El programa en cuestión es Checkinstall. Nos permite generarnos debs a partir del código fuente  de forma tan fácil como:

<pre>
./configure
make
checkinstall
</pre>

Al ejecutar el checkinstall este nos pregunta acerca de la descripción que queremos poner al paquete, el tipo de paquete(RPM, DEB o SLACKWARE TGZ), así como el maintainer, version, licencia... Y después de indicárselo tendremos en el directorio nuestro programa en forma de paquete deb/rpm/tgz. Además el programa nos permite poner documentación que luego se instalará en /usr/share/doc, también podemos ejecutar scripts preinstall/postinstall y preremove/postremove y puede que más cosas que no he mirado.

