--- 
wordpress_id: 20
layout: post
title: Encontrar procesos zombi
wordpress_url: http://localhost/blog/?p=20
---
Cuando tenemos una máquina que no funciona correctamente es posible que los procesos estén en estado zombi. Para poder ver los procesos en este estado usamos el comando siguiente:

<pre>
ps -el | grep 'Z'
</pre>

Con el comando <tt>ps -el</tt> se puede obtener una salida en la que la segunda columna indica el estado del proceso. Existen varios estados:

<pre>
  S : sleeping
R : running
D : waiting
T : gestopt (suspended)
Z : zombie (defunct)
</pre>
Un ejemplo podría ser el siguiente:

<pre>
# ps -el | grep 'Z'
F S   UID   PID  PPID  C PRI  NI ADDR    SZ WCHAN  TTY   TIME CMD
1 Z     0  1213   589  0  75   0    -     0 funct&gt; ?    00:00:00 find
</pre>

Donde vemos que el proceso <tt>dovecot-auth</tt> está en estado zombi.
