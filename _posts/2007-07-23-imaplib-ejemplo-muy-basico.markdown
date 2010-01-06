--- 
wordpress_id: 69
layout: post
title: "imaplib - Ejemplo muy b\xC3\xA1sico"
wordpress_url: http://blog.inbatu.com/2007/07/23/imaplib-ejemplo-muy-basico/
---
Estoy de vuelta con python, que desde antes de exámenes no había tocado nada. Y como estoy llegando al final del Learning Python, donde he visto que existe la librería poplib, me ha dado por probar <code>imaplib</code>.

Dejo aquí un sencillo ejemplo que muestra todos los mensajes de un buzón IMAP.

{% highlight python %}
#!/usr/bin/python

import imaplib, getpass

if __name__ == '__main__':
	
	host = raw_input('Host: ')
	user = raw_input('User: ')
	passw = getpass.getpass('Password: ')
        
	mail = imaplib.IMAP4(host)
	mail.login(user,passw)
	mail.select()
	
	typ, data = mail.search(None, 'ALL')
	for num in data[0].split():
		typ, data = mail.fetch(num, '(RFC822)')
		print '\\n----------------------------------\\n',
		print 'Message %s' % num,
		print '\\n----------------------------------\\n',
		print '\\n%s\\n' % data[0][1]
		raw_input('Next message...')
		
	mail.close()
	mail.logout()
{% endhighlight %}
