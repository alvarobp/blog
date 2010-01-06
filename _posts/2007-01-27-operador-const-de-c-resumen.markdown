--- 
wordpress_id: 59
layout: post
title: Operador const de C++ (Resumen)
wordpress_url: http://blog.inbatu.com/2007/01/27/operador-const-de-c-resumen/
---
<h3>Variables constantes</h3>
<ul>
<li><code>const int entero;</code>
Entero constante, una vez inicializada la variable entero no podrá ser cambiado su valor.</li>
<li><code>const int * pentero;   ó   int const * pentero;</code>
Puntero a entero constante, el contenido del puntero pentero no se podrá cambiar.</li>
<li><code>int * const pentero;</code>
Puntero constante a entero, no se podrá cambiar el puntero.</li>
</ul>
Como regla general const afecta al elemento que está inmediatamente a su izquierda, si no hay nada al que está inmediatamente a su derecha.

<h3>Valores constantes de retorno de función</h3>

{% highlight cpp %}
const char * Funcion()
{ return "Un texto"; }

Funcion()[1] = 'a'; // Error
{% endhighlight %}

La variable devuelta no se puede modificar pues es constante.

<h3>Parámetros constantes</h3>

{% highlight python %}
void mostrarPila(const Pila &p);
{% endhighlight %}

Como mostrarPila no debe modificar la pila pasamos el objeto pila a mostrar por referencia y constante. De esta manera no podremos modificar el objeto p, ni acceder a métodos de este que no se hayan declarado como const.

<h3>Métodos constantes</h3>

{% highlight python %}
class Tipo {
...
  void imprime() const;
...
}
{% endhighlight %}

Evita que el método imprime pueda modificar los miembros del objeto.
