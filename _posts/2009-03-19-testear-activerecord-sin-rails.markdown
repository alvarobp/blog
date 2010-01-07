--- 
wordpress_id: 79
layout: post
title: Testear ActiveRecord sin Rails
description: Testear ActiveRecord sin Rails
keywords: activerecord,active,record,rails,rubyonrails,ruby,shoulda,testing,test
wordpress_url: http://blog.inbatu.com/?p=79
---
Hace unos días andaba algo ocioso y me puse a probar como escribir un plugin/gema para rails. Este plugin resultó en una muy sencilla extensión para modelos ActiveRecord, que simplemente mantiene una copia de los valores inversos de created_at y updated_at como enteros, con lo que podemos hacer consultas ordenando por estos campos de forma descendente.

Nada sofisticado. Pero a la hora de escribir los tests me encontré con que quería hacer esos tests independientes de Rails, pues solo afectan a ActiveRecord, y sin necesidad de ningún tipo de configuración. Para ello utilicé varios modelos de ActiveRecord y como base de datos sqlite.

Primero definimos un schema con las tablas de nuestros modelos:

<pre name="code" class="ruby">
ActiveRecord::Schema.define(:version =&gt; 0) do
  create_table :with_created_models, :force =&gt; true do |t|
    t.column :something, :string    
    t.column :created_at, :datetime
    t.column :updated_at, :datetime    
    t.column :created_at_inverse, :integer
  end
end
</pre>

Una vez definido el schema, establecemos nuestro entorno de test, por ejemplo en <code>test_helper.rb</code>:

<pre name="code" class="ruby">
require &#x27;test/unit&#x27;

require &#x27;rubygems&#x27;
require &#x27;active_record&#x27;
require &#x27;shoulda&#x27;

require File.dirname(__FILE__) + &#x27;/../lib/inverse_sortable&#x27;

ActiveRecord::Base.establish_connection({
    :adapter =&gt; &quot;sqlite3&quot;,
    :dbfile =&gt; &quot;test/test.db&quot;
})

class WithCreatedModel &lt; ActiveRecord::Base
end

load(File.dirname(__FILE__) + &quot;/schema.rb&quot;)
</pre>

En este fichero, le decimos a ActiveRecord que utilice como base de datos un fichero de sqlite (test.db), definimos un modelo correspondiente a la tabla en nuestro schema.rb (declarando una clase que hereda de ActiveRecord::Base y con el nombre de la tabla en singular) y por último cargamos dicho schema.

Con esto ya disponemos de un modelo que podemos usar para testear el comportamiento de la extensión inverse_sortable, por ejemplo en <code>inverse_sortable_test.rb</code>:

<pre name="code" class="ruby">
require File.join(File.dirname(__FILE__), &#x27;test_helper&#x27;)

class WithCreatedModel
  acts_as_inverse_sortable
end

class InverseSortableTest &lt; Test::Unit::TestCase
  context &quot;A model that acts as an inverse sortable&quot; do    
    should &quot;have the inverse of its created_at time when is created if created_at_inverse is available&quot; do
      with_created = WithCreatedModel.create(:something =&gt; &quot;Testing&quot;)
      
      assert_not_nil with_created.created_at_inverse
      assert_equal -with_created.created_at.to_i, with_created.created_at_inverse
    end
    # ...
end
</pre>

Para quién pueda interesar, tanto el plugin como los tests están en <a href="http://github.com/alvarobp/inverse_sortable">http://github.com/alvarobp/inverse_sortable</a>, donde además hay un pequeño benchmark, sobre lo cual quizá comente en otro post.
