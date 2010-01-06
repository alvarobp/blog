--- 
wordpress_id: 24
layout: post
title: "Creaci\xC3\xB3n de un repositorio Debian autom\xC3\xA1tico"
wordpress_url: http://localhost/blog/?p=24
---
En este post voy a explicar cómo crear un repositorio para alojar nuestros propios paquetes .deb . Para ello necesitaremos tener instalado el paquete <tt>apt-utils</tt> que seguramente ya lo estará.
<h3>Preparando el repositorio</h3>
Antes que nada deberemos crear un directorio raíz donde se hallará el resto de directorios y ficheros. Por ejemplo creamos el directorio <tt>/var/repo</tt>.

Una vez creado el raíz habrá que crear dentro de el la estructura de directorios, por ejemplo para la distribución sarge creamos la siguiente estructura:

<pre>
/dists
/dists/sarge
/dists/sarge/contrib
/dists/sarge/contrib/binary-i386
/dists/sarge/contrib/source
/dists/sarge/main
/dists/sarge/main/binary-i386
/dists/sarge/main/source
/dists/sarge/non-free
/dists/sarge/non-free/binary-i386
/dists/sarge/non-free/source
</pre>

Donde vemos que primero se crea el directorio dists, donde luego habrá un directorio por cada distribución (en nuestro caso solo sarge). Dentro de la distribución (sarge) tendremos las diferentes secciones, <tt>main</tt> para paquetes libres, <tt>non-free</tt> para paquetes no libres, y <tt>contrib</tt> para paquetes libres que dependen de otros paquetes que no lo son.

Una vez creadas las secciones creamos un directorio para los binarios, <tt>binary-<arquitectura></tt> en este caso como serán exclusivamente para arquitectura i386 solo necesitaremos <tt>binary-i386</tt>, y un directorio para los fuentes, <tt>source</tt>.
<h3>Llenando el repositorio</h3>
Una vez creada la estructura ya podemos alojar nuestros paquetes. Para ello tenemos que copiar los .deb correspondientes a paquetes binarios en los directorios <tt>binary-i386</tt> de cada sección. Si además queremos distribuir los fuentes copiaremos los ficheros <tt>.dsc  -diff.tar.gz .orig.tar.bz</tt> en los directorios <tt>source</tt>.

En cada directorio <tt>binary-i386</tt> y <tt>source</tt> necesitamos un fichero <tt>Release</tt> cuyo contenido sería el siguiente:

<pre>
Archive: stable
Component: main
Origin: &lt;Tu nombre u organizacion&gt;
Label: &lt;Una etiqueta descriptiva&gt;
Architecture: &lt;Arquitectura de tu procesador o &quot;source&quot; 
                        para los directorios de fuentes&gt;
</pre>
<h3>Ficheros de configuración</h3>
Necesitamos dos ficheros de configuración:
<tt> </tt>
<ul>
	<li><tt>apt-sarge-release.conf</tt></li>
	<li><tt>apt-ftparchive.conf</tt></li>
</ul>
Ambos ficheros los pondremos en el directorio raíz del repositorio. Y su contenido sería el siguiente:
<h4>apt-sarge-release.conf</h4>
<pre>
APT::FTPArchive::Release::Origin "Tu nombre u organizacion";
APT::FTPArchive::Release::Label "Etiqueta descriptiva";
APT::FTPArchive::Release::Suite "stable";
APT::FTPArchive::Release::Codename "sarge";
APT::FTPArchive::Release::Architectures "i386 source";
APT::FTPArchive::Release::Components "main contrib non-free";
APT::FTPArchive::Release::Description "Descripcion detallada";
</pre>
<h4>apt-ftparchive.conf</h4>

<pre>
Dir {
  ArchiveDir ".";
  CacheDir ".";
};

Default {
  Packages::Compress "gzip bzip2";
  Sources::Compress "gzip bzip2";
  Contents::Compress "gzip bzip2";
};

BinDirectory "dists/sarge/main/binary-i386" {
  Packages "dists/sarge/main/binary-i386/Packages";
  Contents "dists/sarge/Contents-i386";
  SrcPackages "dists/sarge/main/source/Sources";
};

BinDirectory "dists/sarge/contrib/binary-i386" {
  Packages "dists/sarge/contrib/binary-i386/Packages";
  Contents "dists/sarge/Contents-i386";
  SrcPackages "dists/sarge/contrib/source/Sources";
};

BinDirectory "dists/sarge/non-free/binary-i386" {
  Packages "dists/sarge/non-free/binary-i386/Packages";
  Contents "dists/sarge/Contents-i386";
  SrcPackages "dists/sarge/non-free/source/Sources";
};

Tree "dists/sarge" {
  Sections "main contrib non-free";
  Architectures "i386 source";
};

Default {
  Packages {
    Extensions ".deb";
  };
};
</pre>

Una vez tenemos los ficheros de configuración adecuados a nuestras necesidades hemos de ejecutar un par de comandos, los cuales podemos meter en un script llamado por ejemplo <tt>update-archive.sh</tt>:

{% highlight bash %}
#!/bin/sh
apt-ftparchive generate apt-ftparchive.conf
apt-ftparchive -c apt-dapper-release.conf release dists/dapper/ 
               >dists/dapper/Release
{% endhighlight %}

<h3>Actualizando el repositorio</h3>
Una vez hemos puesto los paquetes dentro de los directorios correspondientes de su sección ejecutamos el script <tt>update-archive.sh</tt>, obteniendo una salida como la siguiente:

{% highlight bash %}
$ ./update-archive.sh
 dists/sarge/main/binary-i386: 21 files 42.7MB 2s
 dists/sarge/contrib/binary-i386: 0 files 0B 0s
 dists/sarge/non-free/binary-i386: 4 files 114MB 5s
 dists/sarge/main/binary-i386/: 21 files 42.7MB 0s
 dists/sarge/contrib/binary-i386/: 0 files 0B 0s
 dists/sarge/non-free/binary-i386/: 4 files 114MB 0s
 dists/sarge/main/source/: 2 pkgs in 0s
 dists/sarge/contrib/source/: 0 pkgs in 0s
 dists/sarge/non-free/source/: 0 pkgs in 0s
Done Packages, Starting contents.
Done. 314MB in 50 archives. Took 7s
{% endhighlight %}

<h3>Usando el repositorio</h3>
Después de los pasos anteriores ya podemos utilizar el repositorio modificando el fichero <tt>/etc/apt/sources.list</tt>:
<ul>
	<li>Para acceso local
<tt>deb file:///var/repo sarge main contrib non-free</tt></li>
	<li>Para acceso remoto (si por ejemplo hacemos un enlace simbólico a /var/svn dentro del direcorio de un servidor http):
<tt>deb http://nuestro.servidor/repositorio sarge main contrib non-free</tt></li>
</ul>
<h3>Nota</h3>
Este post es prácticamente una traducción de un howto cuyo link es <a href="http://people.connexer.com/~roberto/howtos/debrepository">este</a>.

En un próximo post pondré como añadir nuestra firma al repositorio con gpg.
