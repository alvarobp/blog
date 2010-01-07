--- 
wordpress_id: 61
layout: post
title: Parsear HTML con BeautifulSoup
wordpress_url: http://blog.inbatu.com/2007/02/28/parsear-html-con-beautifulsoup/
---
Voy a poner un ejemplo de uso de <a href="http://www.crummy.com/software/BeautifulSoup/">BeautifulSoup</a>, un módulo para Python con el que podemos parsear HTML.

Lo primero que tenemos que hacer es descargar la librería desde <a href="http://www.crummy.com/software/BeautifulSoup/download/BeautifulSoup.tar.gz">aquí</a>.
Una vez instalado vamos a ver un sencillo ejemplo:

<pre name="code" class="python">
from BeautifulSoup import BeautifulSoup

html = &#x27;&#x27;&#x27;&lt;html&gt;
  &lt;head&gt;&lt;title&gt;Titulo de la pagina&lt;/title&gt;&lt;/head&gt;
  &lt;body&gt;
  &lt;div id=&quot;cabecera&quot;&gt;&lt;h1&gt;Cabecera&lt;/h1&gt;&lt;/div&gt;
  &lt;div id=&quot;contenido&quot;&gt;
    Vamos a poner una lista.

    Lista:
    &lt;ul id=&quot;lista1&quot;&gt;
      &lt;li&gt;Elemento 1&lt;/li&gt;
      &lt;li&gt;Elemento 2&lt;/li&gt;
      &lt;li&gt;Elemento 3&lt;/li&gt;
      &lt;li&gt;Elemento 4&lt;/li&gt;
    &lt;/ul&gt;
    
  &lt;/div&gt;
  &lt;/body&gt;
  &lt;/html&gt;&#x27;&#x27;&#x27;

soup = BeautifulSoup(html)

# Mostramos el titulo de la pagina
print soup.head.title.string

# Mostramos la cabecera
print soup.find(&quot;div&quot;,{&quot;id&quot;:&quot;cabecera&quot;}).contents

# Mostramos el contenido
contenido = soup.find(&quot;div&quot;,{&quot;id&quot;:&quot;contenido&quot;})
print contenido.contents

# Ahora mostramos todos los elementos de lista1
lista = contenido.find(&quot;ul&quot;,{&quot;id&quot;:&quot;lista1&quot;})
for x in lista:
    print x.string
&lt;/pre&gt;

Si en lugar de pasar una cadena con el c&oacute;digo html quisieramos leer de una url lo podr&iacute;amos hacer as&iacute;:

&lt;pre name=&quot;code&quot; class=&quot;python&quot;&gt;
...
import urllib2

sock = urllib2.urlopen(&quot;http://servidor/documento.html&quot;)
soup = BeautifulSoup(sock.read())
...
</pre>

Esto es un ejemplo muy sencillo de lo que se puede hacer, para más detalles leer la <a href="http://www.crummy.com/software/BeautifulSoup/documentation.html">documentación</a>.
