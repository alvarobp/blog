--- 
wordpress_id: 61
layout: post
title: Parsear HTML con BeautifulSoup
wordpress_url: http://blog.inbatu.com/2007/02/28/parsear-html-con-beautifulsoup/
---
Voy a poner un ejemplo de uso de <a href="http://www.crummy.com/software/BeautifulSoup/">BeautifulSoup</a>, un módulo para Python con el que podemos parsear HTML.

Lo primero que tenemos que hacer es descargar la librería desde <a href="http://www.crummy.com/software/BeautifulSoup/download/BeautifulSoup.tar.gz">aquí</a>.
Una vez instalado vamos a ver un sencillo ejemplo:

{% highlight python %}
from BeautifulSoup import BeautifulSoup

html = '''<html>
  <head><title>Titulo de la pagina</title></head>
  <body>
  <div id="cabecera"><h1>Cabecera</h1></div>
  <div id="contenido">
    Vamos a poner una lista.

    Lista:
    <ul id="lista1">
      <li>Elemento 1</li>
      <li>Elemento 2</li>
      <li>Elemento 3</li>
      <li>Elemento 4</li>
    </ul>
    
  </div>
  </body>
  </html>'''

soup = BeautifulSoup(html)

# Mostramos el titulo de la pagina
print soup.head.title.string

# Mostramos la cabecera
print soup.find("div",{"id":"cabecera"}).contents

# Mostramos el contenido
contenido = soup.find("div",{"id":"contenido"})
print contenido.contents

# Ahora mostramos todos los elementos de lista1
lista = contenido.find("ul",{"id":"lista1"})
for x in lista:
    print x.string
{% endhighlight %}

Si en lugar de pasar una cadena con el código html quisieramos leer de una url lo podríamos hacer así:

{% highlight python %}
...
import urllib2

sock = urllib2.urlopen("http://servidor/documento.html")
soup = BeautifulSoup(sock.read())
...
{% endhighlight %}

Esto es un ejemplo muy sencillo de lo que se puede hacer, para más detalles leer la <a href="http://www.crummy.com/software/BeautifulSoup/documentation.html">documentación</a>.
