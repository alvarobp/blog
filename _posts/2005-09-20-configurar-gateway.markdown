--- 
wordpress_id: 17
layout: post
title: Configurar Gateway
wordpress_url: http://localhost/blog/?p=17
---
Lo que voy a explicar es una forma de hacer que una máquina (servidor) actúe como pasarela a internet, es decir compartir la conexión a internet entre varios equipos. Para ello nuestro servidor deberá constar de dos tarjetas de red. Una de ellas conectada a "internet" (modem) y la otra a otro equipo ya sea otro pc o un switch.
<p>
Bueno pues lo primero que necesitaremos que nuestro kernel debe soportar iptables (versiones 2.4 en adelante) así como realizar nat mediante este. Para ello tenemos que tener activados los modulos
ip_tables e iptable_nat. </p>
<p>Una vez nos aseguramos de ello deberemos ejecutar lo siguiente: </p>
<pre>iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE</pre>
<p>
Donde 192.168.0.0/24 indica que redireccionaremos a toda la subred 192.168.0.0 (con máscara 255.255.255.0) y eth0 es la interfaz de red conectada a internet.<br /> <br />Después debemos activar el ip forwarding de la ejecutando lo siguiente:</p>
<p>
<tt>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</tt></p>
<p>
Con esto ya tenemos a nuestra máquina haciendo funciones de pasarela. Pero en este punto si reiniciamos el ordenador se perderá la configuración y tendremos que volver a ejecutar los dos comandos anteriores. Para solucionar esto los metemos en un script, algo así como:</p>
<pre name="code" class="bash">
#! /bin/sh
echo -n "Iniciando Gateway... "
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE

echo "1" &gt; /proc/sys/net/ipv4/ip_forward
echo "Iniciado."
</pre>
<p>Guardamos este script como /etc/init.d/gateway, por ejemplo, le damos permisos de ejecución y creamos enlaces simbólicos a él para los runlevels que nos interesen, p. ej para el 2, como sigue:</p>
<p><tt>ln -s /etc/init.d/gateway /etc/rc2.d/S99gateway</tt></p>
<p>Solo resta configurar los clientes, utilizando como puerta de enlace la ip de nuestro servidor (p. ej. 192.168.0.1 en caso de que hayamos configurado esa ip en la segunda tarjeta de red de nuestro servidor) y para las DNS tenemos dos posibilidades:</p>

- Poner directamente las DNS de nuestro proveedor de servicios.
- Instalar bind en nuestra máquina servidor (lo que se escapa de esta explicación).
