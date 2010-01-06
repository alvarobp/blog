--- 
wordpress_id: 81
layout: post
title: Trivial friendly URL routing for Ruby on Rails
wordpress_url: http://blog.inbatu.com/?p=81
---
Back to the times I was programming in PHP (it hasn't been that long but it feels like an eternity has passed), I worked in a company own made CMS. One of my biggest headaches was tuning and reimplementing the friendly URL generator.

Having the need to implement friendly URLs for a little and very specific CMS using Rails I found that it was a trivial matter. So I basically came up with a model acting as a tree (let's call it Page), a route and a class method.

First thing I did was creating a model Page with the fields I needed plus, a <code>slug</code> string field, plus a <code>parent_id</code> integer field. I installed the <code>acts_as_tree</code> plugin and made my model use it.

Then I set up a route:
{% highlight ruby %}
   map.connect '*slugs', :controller => 'pages', :action => 'show'
{% endhighlight %}

Next thing was creating a class method to process the slugs chain:
{% highlight ruby %}
class Page < ActiveRecord::Base
  def self.locate_by_slugs(slugs, parent_id=nil)
    page = if slugs.size == 1
      Page.find_by_slug_and_parent_id!(slugs.first, parent_id)
    else
      parent_page = Page.find_by_slug!(slugs.shift, :select => 'id')
      Page.locate_by_slugs(slugs, parent_page.id)
    end
  end
end
{% endhighlight %}

Lastly, I created the show action on PagesController:
{% highlight ruby %}
class PagesController < ApplicationController  
  def show
    @page = Page.locate_by_slugs(params[:slugs].dup)
  end
end
{% endhighlight %}

Well, I haven't carried out a revolution, it's nothing fancy, it's been done a million times before, I don't even talk about the slug generation process. This post is just another evidence of how amazing the Ruby on Rails framework is.
