--- 
wordpress_id: 8
layout: post
title: "Intent\xC3\xA1ndolo con Gtkmm"
wordpress_url: http://localhost/blog/?p=8
---
Ayer tarde decidí probar, ahora que tengo unas nociones un poco más amplias de C++ y de la programación en general (y orientada a objetos en particula), el uso de la librería Gtkmm. Por si alguien no sabe lo que es, es una interfaz de C++ para GTK+.

Empezando con el <a href="http://www.gtkmm.org/docs/gtkmm-2.4/docs/tutorial/html/index.html">tutorial</a> que se encuentra en la <a href="http://www.gtkmm.org">web oficial</a> del proyecto, he visto de forma escueta los principios muy muy básicos. Vamos el HolaMundo.

Por ejemplo, añadiendo el include <em> &lt;gtkmm .h&gt;</em>  y mediante el siguiente código creamos una ventana principal vacía y la mostramos:

<code>
Gtk::Main kit(argc, argv[]);
Gtk::Window w;
Gtk::Main::run(w);
</code>

Y bueno, el hola mundo, que simplemente consta de un botón que muestra una cadena en la consola, ya es un pelín más complicado.

Resumiendo, que por ahora me voy enterando de lo que gasto, porque y, más o menos como funciona. Lo que no entiendo muy bien, porque aún no lo he estudiado/mirado, son temas como la herencia, los miembros virtual... Pero vamos que con las nociones básicas que tengo de las clases, ya comprendo mejor todo el tema.

Asi es que seguiré en ello hasta por lo menos terminar este tutorial, espero llegar y haberlo comprendido.

Saludos
