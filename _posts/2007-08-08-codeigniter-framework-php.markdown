--- 
wordpress_id: 70
layout: post
title: Codeigniter - Framework PHP
wordpress_url: http://blog.inbatu.com/2007/08/08/codeigniter-framework-php/
---
He estado probando estos días el framework PHP (a la rails) <a href="http://www.codeigniter.com">CodeIgniter</a>. De momento la impresión es buena. En mi línea, pongo un ejemplo.

Modificando un par de ficheros de configuración o tres (un par de líneas en cada uno) y creando los siguientes dos ficheros he obtenido una sencilla aplicación que muestra las entradas de mi blog de wordpress.

El fichero del controlador (<tt>controllers/blog.php</tt>):

<pre name="code" class="php">

class Blog extends Controller {
  function Blog() {
    parent::Controller();

    $this->load->scaffolding('bb_posts');
  }

  function index() {
    $data['title'] = "BatU's Stack";
    $data['heading'] = "piling up experiences...";
    $this->db->orderby("post_date", "desc");
    $data['query'] = $this->db->get('bb_posts');

    $this->load->view('blog_view', $data);
  }
}
</pre>

El fichero de la vista correspondiente (<tt>views/blog_view.php</tt>):

<pre name="code" class="html">
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot;
  &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;
&lt;html&gt;
&lt;head&gt;
  &lt;meta http-equiv=&quot;Content-type&quot; content=&quot;text/html;
    charset=utf-8&quot;&gt;
  &lt;title&gt;Blog&lt;/title&gt;

  &lt;link rel=&quot;stylesheet&quot; href=&quot;/bblog/css/style.css&quot; 
    type=&quot;text/css&quot; media=&quot;screen&quot;
    title=&quot;no title&quot; charset=&quot;utf-8&quot;&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;div id=&quot;box&quot;&gt;
    &lt;div id=&quot;header&quot;&gt;
      &lt;h1&gt;&lt;?=$title?&gt;&lt;/h1&gt;
      &lt;h2&gt;&lt;?=$heading?&gt;&lt;/h2&gt;
    &lt;/div&gt;
    &lt;div id=&quot;posts&quot;&gt;
      &lt;?php foreach($query-&gt;result() as $post): ?&gt;
        &lt;div class=&quot;post&quot;&gt;
          &lt;h3&gt;&lt;?=$post-&gt;post_title?&gt;&lt;/h3&gt;

          &lt;div class=&quot;post_content&quot;&gt;
            &lt;?=$post-&gt;post_content?&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;?php endforeach; ?&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<strike>Dejo aquí la URL del ejemplo: <a href="http://testing.inbatu.com/bblog/index.php/blog">http://testing.inbatu.com/bblog/index.php/blog</a></strike>
