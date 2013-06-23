--- 
wordpress_id: 25
layout: post
title: "GNU/Emacs - Comandos básicos I"
wordpress_url: http://batuz.dyndns.org/blog/?p=25
---
Los comandos que pongo aquí son de la forma <tt>C-x</tt>, <tt>M-x</tt>, esto quiere decir, en el caso de <tt>C-x</tt> que debemos pulsar la tecla <tt>CONTROL</tt> y a la vez la tecla <tt>x</tt>. En el caso de <tt>M-x</tt> debemos pulsar la tecla <tt>META</tt> (<tt>ALT</tt> ó <tt>ESC</tt>) y a la vez la tecla <tt>x</tt>. Bueno, una vez aclarado esto paso a listar un resumen de los comandos básicos. 

Nota: Entre paréntesis pondré el nombre largo del comando por ejemplo <i>find-file</i>, que se corresponde con el atajo <tt>C-x C-f</tt>, con lo cual podremos ejecutar este comando o bien mediante el atajo o bien haciendo <tt>M-x find-file RETURN</tt>.

<h4>Abrir, insertar y guardar ficheros</h4>
<ul>
<li><b>C-x C-f</b> (<i>find-file</i>): Abre un fichero existente o si no abre uno nuevo.</li>
<li><b>C-x C-v</b> (<i>find-alternate-file</i>): Carga un fichero diferente en ese mismo buffer, nos sirve si por ejemplo queriamos abrir un fichero y nos hemos equivocado al escribir el nombre.</li>
<li><b>C-x i</b> (<i>insert-file</i>): Inserta el contenido de un fichero dentro del buffer actual (en la posición del cursor).</li>
<li><b>C-x C-s</b> (<i>save-buffer</i>): Guarda el contenido del buffer en el fichero asociado (y si no lo tiene pregunta el nombre de fichero con el que guardarlo).</li>
<li><b>C-x C-w</b> (<i>write-file</i>): Guarda el contenido del buffer preguntando el nombre del fichero en el que guardar.</li>
<li><b>C-x C-c</b> : Sale de emacs, preguntando si guardar los cambios o no en caso de que hayan buffers modificados sin guardar.
</li></ul>

<h4>Ayuda</h4>
<ul>
<li><b>C-h ?</b> (<i>help</i>): Muestra las opciones de ayuda de Emacs.</li>
<li><b>C-h t</b> (<i>help-with-tutorial</i>): Inicia un tutorial de introducción a Emacs.</li>
<li><b>C-h k</b> (<i>describe-key</i>): Muestra información sobre una combinación de teclas. Por ejemplo <tt>C-h k C-x i</tt> muestra una descripción del comando <i>insert-file</i>.</li>
<li><b>C-h f</b> (<i>describe-function</i>): Muestra información sobre un comando. La información mostrada es la misma que en el anterior pero en lugar de pasarle una combinación de teclas le pasamos el comando directamente.</li>
</ul>

<h4>Moviéndonos por los ficheros</h4>
<ul>
<li><b>C-f</b> (<i>forward-char</i>): Mueve el cursor un carácter hacia adelante.</li>
<li><b>C-b</b> (<i>backward-char</i>): Mueve el cursor un carácter hacia atrás.</li>
<li><b>C-p</b> (<i>previous-line</i>): Mueve el cursor a la línea anterior.</li>
<li><b>C-n</b> (<i>next-line</i>): Mueve el cursor a la línea siguiente.</li>
<li><b>M-f</b> (<i>forward-word</i>): Mueve el cursor una palabra hacia adelante.</li>
<li><b>M-b</b> (<i>backward-word</i>): Mueve el cursor una palabra hacia atrás.</li>
<li><b>C-a</b> (<i>beginning-of-line</i>): Mueve el cursor al principio de la línea.</li>
<li><b>C-e</b> (<i>end-of-line</i>): Mueve el cursor al final de la línea.</li>
<li><b>M-a</b> (<i>backward-sentece</i>): Mueve el cursor una frase hacia atrás.</li>
<li><b>M-e</b> (<i>forward-sentece</i>): Mueve el cursor una frase hacia adelante.</li>
<li><b>M-{</b> (<i>backward-paragraph</i>): Mueve el cursor un párrafo hacia atrás.</li>
<li><b>M-}</b> (<i>forward-paragraph</i>): Mueve el cursor un párrafo hacia adelante.</li>
<li><b>C-x [</b> (<i>backward-page</i>): Mueve el cursor una página hacia atrás.</li>
<li><b>C-x ]</b> (<i>forward-page</i>): Mueve el cursor una página hacia adelante.<p>Nota: Emacs se mueve entre páginas usando un delimitador de página (que se define mediante la variable <i>page-delimiter</i>). En el modo texto el delimitador de página (no imprimible) se puede insertar mediante <tt>C-q C-l</tt> (L minúscula), que insertará <tt>^L</tt> que aunque parezcan dos carácteres es uno solo.</p></li>

<li><b>C-v</b> (<i>scroll-up</i>): Avanza una pantalla hacia adelante, mostrando dos líneas de la pantalla anterior.</li>
<li><b>M-v</b> (<i>scroll-down</i>): Avanza una pantalla hacia atrás</li>
<li><b>M-&gt;</b> (<i>end-of-buffer</i>): Lleva el cursor al final del fichero.</li>
<li><b>M-&lt;</b> (<i>beginning-of-buffer</i>): Lleva el cursor al principio del fichero.</li>
<li><b>M-x goto-line <i>n</i> RETURN</b>: Mueve el cursor a la línea <i>n</i> del fichero.</li>
<li><b>M-x goto-char <i>n</i> RETURN</b>: Mueve el cursor al carácter <i>n</i> del fichero.</li>
</ul>

<h4>Repetir comandos</h4>
<ul>
<li><b>M <i>n</i></b> (<i>digit-argument</i>): Repite el comando escrito a continuación <i>n</i> veces.</li>
<li><b>C-u <i>n</i></b> (<i>universal-argument</i>): Hace exactamente lo mismo que la anterior.</li>
<li><b>C-u</b>: Este comando sin argumentos repite el comando escrito a continuación 4 veces. Si hacemos <tt>C-u C-u</tt> lo repetiría 16 veces, <tt>C-u C-u C-u</tt> 64 veces, etc.
</li></ul>

<h4>Redibujar la pantalla</h4>
<ul><li><b>C-l</b> (<i>recenter</i>): Redibuja la pantalla, poniendo la línea actual en el centro.<p>Este comando es útil cuando por ejemplo estamos editando en consola y el kernel nos tira mensajes, con este comando emacs redibuja la pantalla con la información del buffer. También nos es útil si estamos editando una porción de texto que nos aparece al final del display, usamos este comando y nos centra la línea actual, así vemos lo que tenemos por encima y por debajo.</p></li></ul>
