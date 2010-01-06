--- 
wordpress_id: 16
layout: post
title: Probando subversion
wordpress_url: http://localhost/blog/?p=16
---
He estado trasteando un poco (bastante poco la verdad) con el tan resonado software de control de versiones Subversion y la verdad, creía que no me serviría hasta que fuera a hacer algo serio y tal, pero es muy útil y fácil de utilizar.

Según he entendido, básicamente es un sistema de ficheros (o algo parecido) que guarda información en una base de datos acerca de todos los cambios que se realizan sobre los ficheros añadidos a los diferentes repositorios. Un repositorio (se pueden tener todos los que se quiera) no es más, a mi entender, que un contenedor de directorios y ficheros, en el que los usuarios van guardando archivos nuevos, actualizando existentes, eliminando... dando para cada una de estas acciones comentarios sobre lo que y porque lo hacen. De esta manera el sistema subversion guarda un historial de todos esos cambios referentes a cada acción, teniendo así un alto control del proyecto. Todos estos cambios se pueden extraer en un ChangeLog.

Bueno esa es la visión global que he tenido en un ratito. Dejo aquí algunos comandos para ilustrar la facilidad de este sistema:

<ul>
<li>Crear un repositorio: <p><code>svnadmin create /directorio/directorio</code></p></li>
<li>Importar un proyecto ya existente en un repositorio: <p><code>svn import /directorio/dir http://server/dir -m "Comentario"</code></p><p>Los repositorios se indican con URLs (file://, http://...)</p></li>
<li>Añadir un fichero al proyecto:<p><code>svn add fichero<br />svn commit fichero -m "comentario"</code></p><p>Con add indicamos a subversion que vamos a controlar ese fichero y con commit subimos los cambios (la primera vez pues subimos el original)</p></li>
<li>Actualizar nuestra copia local de trabajo:<p><code>svn update</code></p><p>Desde el directorio que queremos actualizar.</p></li></ul>
Y bueno muchas más cosas interesantes. Será cuestión de intentar darle uso durante este curso, de hecho un amigo y yo ya hemos pensado usarlo para pasar a LaTeX los apuntes de matemáticas. Todo se andará.

Salu2
