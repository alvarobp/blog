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

{% highlight ruby %}
ActiveRecord::Schema.define(:version => 0) do
  create_table :with_created_models, :force => true do |t|
    t.column :something, :string    
    t.column :created_at, :datetime
    t.column :updated_at, :datetime    
    t.column :created_at_inverse, :integer
  end
end
{% endhighlight %}

Una vez definido el schema, establecemos nuestro entorno de test, por ejemplo en <code>test_helper.rb</code>:

{% highlight ruby %}
require 'test/unit'

require 'rubygems'
require 'active_record'
require 'shoulda'

require File.dirname(__FILE__) + '/../lib/inverse_sortable'

ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :dbfile => "test/test.db"
})

class WithCreatedModel < ActiveRecord::Base
end

load(File.dirname(__FILE__) + "/schema.rb")
{% endhighlight %}

En este fichero, le decimos a ActiveRecord que utilice como base de datos un fichero de sqlite (test.db), definimos un modelo correspondiente a la tabla en nuestro schema.rb (declarando una clase que hereda de ActiveRecord::Base y con el nombre de la tabla en singular) y por último cargamos dicho schema.

Con esto ya disponemos de un modelo que podemos usar para testear el comportamiento de la extensión inverse_sortable, por ejemplo en <code>inverse_sortable_test.rb</code>:

{% highlight ruby %}
require File.join(File.dirname(__FILE__), 'test_helper')

class WithCreatedModel
  acts_as_inverse_sortable
end

class InverseSortableTest < Test::Unit::TestCase
  context "A model that acts as an inverse sortable" do    
    should "have the inverse of its created_at time when is created if created_at_inverse is available" do
      with_created = WithCreatedModel.create(:something => "Testing")
      
      assert_not_nil with_created.created_at_inverse
      assert_equal -with_created.created_at.to_i, with_created.created_at_inverse
    end
    # ...
end
{% endhighlight %}

Para quién pueda interesar, tanto el plugin como los tests están en <a href="http://github.com/alvarobp/inverse_sortable">http://github.com/alvarobp/inverse_sortable</a>, donde además hay un pequeño benchmark, sobre lo cual quizá comente en otro post.
