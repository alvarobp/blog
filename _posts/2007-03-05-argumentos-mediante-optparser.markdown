--- 
wordpress_id: 67
layout: post
title: Argumentos con OptionParser
wordpress_url: http://blog.inbatu.com/2007/03/05/argumentos-mediante-optparser/
---
En la versión 2.3 de Python se añadió el módulo <a href="http://docs.python.org/lib/module-optparse.html">optparse</a> a la librería estándar, el cual nos sirve para parsear las opciones y argumentos que se pasan a nuestros programas, haciendo fácil y cómodo el lidiar con ellos.

Pondré un ejemplo:

{% highlight python %}
from optparse import OptionParser

if __name__ == '__main__':
    usage = "%prog [options] arg1 arg2"

    parser = OptionParser(usage=usage, version="%prog 1.0")
    parser.add_option('-v','--verbose', action='store_true',
                      dest='verbose', help='shows detailed information')
    parser.add_option('-q','--quiet', action='store_false',
                      dest='verbose', help='hides detailed information')
    parser.add_option('-f','--filename', action='store',
                      dest='filename', help='name of the file to load')


    (options, args) = parser.parse_args()

    if options.verbose:
        print "Extra info enabled"
    else:
        print "Extra info disabled"
    if options.filename:
        print "I'll open", options.filename, "file."
    if args > 0:
        print "\nArguments:"
        for x in args:
            print "  ",x
{% endhighlight %}
Ahora veamos algunos resultados según los argumentos que pasemos (en negrita el comando ejecutado):

{% highlight bash %}
<b>$ python option.py</b>

Extra info disabled
{% endhighlight %}

{% highlight python %}
<b>$ python option.py -v</b>

Extra info enabled
{% endhighlight %}

{% highlight python %}
<b>$ python option.py -h</b>

usage: option.py [options] arg1 arg2

options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -v, --verbose         shows detailed information
  -q, --quiet           hides detailed information
  -f FILENAME, --filename=FILENAME
                        name of the file to load
{% endhighlight %}

{% highlight python %}
<b>$ python option.py -f fichero.txt "First" "Second" "Last argument"</b>

Extra info disabled
I'll open fichero.txt file.

Arguments:
   First
   Second
   Last argument
{% endhighlight %}

Fijaos que distingue las opciones de los argumentos, como se puede ver en el último ejemplo.

*Nota:* He escrito los ejemplos en inglés para no desencajar, porque las cadenas que imprime el módulo están en inglés, aunque estaría bien que pudiera hacerlo en otros idiomas.
