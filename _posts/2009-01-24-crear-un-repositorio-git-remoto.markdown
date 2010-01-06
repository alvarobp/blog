--- 
wordpress_id: 77
layout: post
title: Crear un repositorio Git remoto
wordpress_url: http://blog.inbatu.com/?p=77
---
A modo de receta, he aquí la secuencia de comandos necesaria para la creación de un repositorio Git remoto, a través de SSH. 

El primer paso es crear el repositorio en sí, para ello o bien creamos un directorio vacío donde empezar a meter el código de nuestra aplicación, o bien vamos al directorio donde tenemos ya nuestro código:

{% highlight bash %}
cd appname
git init
{% endhighlight %}

Acto seguido añadimos el contenido al repositorio y comiteamos el cambio:
{% highlight bash %}
git add .
git commit -m "inicilizacion del repositorio"
{% endhighlight %}

El último paso consiste en crear una copia del repositorio la cual subiremos al servidor (o moveremos dentro de la misma máquina, según proceda) y que contiene solamente la información interna de git y no una copia de trabajo:
{% highlight bash %}
git clone --bare appname appname.git
scp -r appname.git ssh://user@yourserver/path/to/git/
{% endhighlight %}

Por último, para comenzar a trabajar sobre el repositorio tenemos dos opciones, clonarlo desde su ubicación remota:
{% highlight bash %}
cd algunsitio
git clone ssh://user@yourserver/path/to/git/appname.git
{% endhighlight %}

lo que nos creará un directorio <code>appname</code> en <code>algunsitio</code> con la copia de trabajo, o bien añadimos el repositorio remoto a la copia actual (creada en el primer paso):

{% highlight bash %}
git remote add origin ssh://user@yourserver/path/to/git/appname.git
{% endhighlight %}
