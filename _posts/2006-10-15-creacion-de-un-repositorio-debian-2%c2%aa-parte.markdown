--- 
wordpress_id: 27
layout: post
title: "Creaci\xC3\xB3n de un repositorio Debian (2\xC2\xAA parte)"
wordpress_url: http://batuz.dyndns.org/blog/?p=27
---
Conforme terminamos lo explicado en la primera parte nuestro repositorio no utiliza firmas. Para ello deberemos firmar los <tt>Release</tt> con gpg, para lo cual necesitamos habernos creado una clave.

<h3>Generación de una clave</h3>

Simplemente hemos de ejecutar el siguiente comando:

<code>gpg --gen-key</code>

Nos hará una serie de preguntas, entre ellas nos pedira un passphrase, que sera la clave privada.

Más adelante necesitaremos importar la clave pública para usar el repositorio, la exportamos con el siguiente comando:

<code>gpg -a --export &gt; clave_publica.gpg</code>

<h3>Firma de los Release</h3>

Ahora que ya poseemos una clave para firmar el repositorio tenemos que firmar los <tt>Release</tt> de cada uno de los directorios:

{% highlight bash %}
cd dists/sarge
gpg -bao Release.gpg Release

cd main/binary-i386
gpg -bao Release.gpg Release
{% endhighlight %}

Esto nos pide el passphrase que introdujimos al generar la clave, y nos genera un fichero <tt>Release.gpg</tt>. Pues bien una vez hemos firmado todos los ficheros <tt>Release</tt> ya tenemos firmado el repositorio.

<h3>Importando la clave pública</h3>

Ahora lo único que nos falta es importar la clave pública exportada anteriormente en cada una de las máquinas que utilizan el repositorio:

<code>apt-key add clave_publica.gpg</code>

Si no hacemos este último paso el apt de cada máquina no reconocerá como firmados los <tt>Release</tt>
