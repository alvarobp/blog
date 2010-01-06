--- 
wordpress_id: 50
layout: post
title: Reordenar PDFs
wordpress_url: http://blog.inbatu.com/2007/01/17/reordenar-pdfs/
---
Buscando como unir PDFs he encontrado <a href="http://www.kriptopolis.org/node/2662" target="_blank">este post</a> en kriptopolis, y he conocido la herramienta <a href="http://www.accesspdf.com/index.php?topic=pdftk" target="_blank">PDFTK</a> que nos permite hacer cosas como unir, encriptar, descomprimir pdfs y más. 

<p>Pondré unos ejemplos:
<ul><li><code>pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf</code><br />Une los tres ficheros (1.pdf, 2.pdf y 3.pdf) en uno solo (123.pdf).</li>
<li><code>pdftk A=1.pdf B=2.pdf cat A1-7 B1-5 A8 output combined.pdf</code><br />Crea un nuevo pdf extrayendo páginas, en este caso el nuevo pdf se compondría de las paginas 1 a 7 de 1.pdf, luego 1 a 5 de 2.pdf y por último la 8 de 1.pdf</li>
<li><code>pdftk doc.pdf output doc_enc.pdf owner_pw contra</code><br />Encripta el PDF con todos los permisos deshabilitados excepto ver el fichero</li>
<li><code>pdftk doc.pdf output doc_enc.pdf owner_pw contra user_pw contra2</code><br />Igual que el anterior pero ahora pedirá password para abrirlo.</li>
</ul>
</p>
Existen más opciones que se pueden ver en la página del programa, para mí con los dos primeros ejemplos ya me es bastante útil.
