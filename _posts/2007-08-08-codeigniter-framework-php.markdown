--- 
wordpress_id: 70
layout: post
title: Codeigniter - Framework PHP
wordpress_url: http://blog.inbatu.com/2007/08/08/codeigniter-framework-php/
---
He estado probando estos días el framework PHP (a la rails) <a href="http://www.codeigniter.com">CodeIgniter</a>. De momento la impresión es buena. En mi línea, pongo un ejemplo.

Modificando un par de ficheros de configuración o tres (un par de líneas en cada uno) y creando los siguientes dos ficheros he obtenido una sencilla aplicación que muestra las entradas de mi blog de wordpress.

El fichero del controlador (<tt>controllers/blog.php</tt>):

{% highlight php %}

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
{% endhighlight %}

El fichero de la vista correspondiente (<tt>views/blog_view.php</tt>):

{% highlight html %}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-type" content="text/html;
    charset=utf-8">
  <title>Blog</title>

  <link rel="stylesheet" href="/bblog/css/style.css" 
    type="text/css" media="screen"
    title="no title" charset="utf-8">
</head>
<body>
  <div id="box">
    <div id="header">
      <h1><?=$title?></h1>
      <h2><?=$heading?></h2>
    </div>
    <div id="posts">
      <?php foreach($query->result() as $post): ?>
        <div class="post">
          <h3><?=$post->post_title?></h3>

          <div class="post_content">
            <?=$post->post_content?>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</body>
</html>
{% endhighlight %}

<strike>Dejo aquí la URL del ejemplo: <a href="http://testing.inbatu.com/bblog/index.php/blog">http://testing.inbatu.com/bblog/index.php/blog</a></strike>
