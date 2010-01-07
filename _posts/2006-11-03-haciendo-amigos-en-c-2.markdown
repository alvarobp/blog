--- 
wordpress_id: 44
layout: post
title: Haciendo amigos en C++
wordpress_url: http://blog.inbatu.com/2006/12/10/haciendo-amigos-en-c/
---
Mediante el uso de la palabra clave <code>friend</code> podemos permitir el acceso a miembros privados o protegidos de una clase a funciones que no pertenecen a esa clase o a permitir el acceso a otras clases. Veremos dos casos ejemplo, declarando una función como <code>friend</code> dentro de la interfaz pública de una clase y declarando una clase como amiga.

<h3>Funciones friend</h3>
Cuando declaramos una función como friend en una clase estamos indicando que esa función tendrá acceso a los miembros privados de la clase, pero la función en cuestión no forma parte del ámbito de la clase. Veamos un ejemplo:

Supongamos que tenemos una clase que representa un número racional como un par de números enteros. Queremos que este tipo nuevo se pueda usar de igual forma que <code>int, double,...</code> así:
<pre name="code" class="cpp">
Racional r(2,3);
cout &lt;&lt; r &lt;&lt; endl;
</pre>
Para poder hacer esto necesitamos sobrecargar el operador de inserción binario <code>operator&lt;&lt;</code> :
<pre name="code" class="cpp">
class Racional
{
     friend ostream &amp;operator&lt;&lt;(ostream &amp;out, const Racional &amp;r);
     public:
     
     Racional(int numerador, int denominador);
     ~Racional();
     // ...
};
</pre>
De esta manera la función friend obtiene acceso completo a los miembros de Racional. La implementación de esta función se haría, fijándonos en que no pertenece al ámbito de la clase:
<pre name="code" class="cpp">
ostream &amp;operator&lt;&lt;(ostream &amp;out, const Racional &amp;r)
{
     // Acceso a los miembros privados de Racional para mostrar r.
     // ...

     return out;
}
</pre>
Podríamos haber declarado la función como no <code>friend</code>, entonces tendríamos que usar métodos públicos get(), set() para obtener los valores, usando friend podemos acceder directamente a los miembros, y además la función forma parte de la interfaz pública de la clase Racional.

<h3>Clases friend</h3>
Además de declarar una función no miembro como friend, podemos declarar funciones miembro de otras clases como friend, así como otras clases como clases amigas.

Las clases amigas se usan en casos donde una clase está íntimamente ligada a otra. Por ejemplo supongamos que tenemos una clase Punto que representa una coordenada, y una clase ColeccionPunto que guarda una lista de puntos. Como la colección quizá necesite manipular objetos Punto, podemos declarar ColeccionPunto como amiga de la clase Punto:
<pre name="code" class="cpp">
// Clase Punto
class Punto
{
     friend ColeccionPunto;

     public:
     Punto(double x, double y) :
     m_x(x),
     m_y(y)
     {
     }

     ~Punto();
     // ...

     private:
     double m_x;
     double m_y;
};
</pre>
Como la clase ColeccionPunto esta declarada como friend, puede acceder a los datos internos de cualquier objeto Punto. Una cosa importante es que esta amistad no es mútua, aunque ColeccionPunto puede acceder a Punto no se da el caso inverso. Además la amistad no es heredable, las clases que deriven de ColeccionPunto no podrán acceder a Punto. El principio detrás de esto es que la amistad no se concede de forma implícita sino que cada clase debe especificar de forma explícita sus amigos.
