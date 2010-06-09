--- 
layout: post
title: Isolating gem sets under Passenger with RVM
description: Run several ruby applications under Passenger with isolated gem sets
keywords: ruby rails rvm gemset gems passenger deploy
---
For those who are thinking about deploying more than one ruby application on the same machine, and find it tricky to deal with different gem versions, here it is a short guide to having distinct gem paths for each project. I believe it suits small applications running under low load.

I started from a clean Debian installation, however I will assume here that apache2 is already installed and ruby is still not.

### Installing RVM

As [RVM documentation](http://rvm.beginrescueend.com/rvm/install) says, run:

    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

then follow the instructions to add rvm to your path.

### Installing Ruby

Once RVM is installed, running `rvm notes` will tell you what is required in order to install ruby versions. As I wanted to install the MRI interpreter (at first) I did install the following packages:

    aptitude install curl bison build-essential zlib1g zlib1g-dev libssl-dev libreadline5-dev libreadline6-dev libxml2-dev git-core subversion autoconf

Now we are ready to compile our first ruby interpreter, I chose to install ruby 1.8.7

    rvm install 1.8.7-head

I like to run my applications using the Ruby Enterprise Edition interpreter, therefore I installed it:

    rvm install ree

I also set it as the default interpreter:

    rvm ree --default --passenger

You may be wondering what we need the MRI interpreter for, well, I basically installed it because the REE installation script is written in Ruby.

### Installing Passenger

In a nutshell:

    gem install passenger
    rvmsudo passenger-install-apache2-module
    
Edit your `/etc/apache2/apache2.conf` (or whatever file inside which you load the passenger module) and set:

    PassengerRuby /home/user/.rvm/bin/passenger_ruby

### Configuring an application

First of all, we need to create a gemset within which the application required gems will be installed:

    rvm gemset create wadusappset
    rvm gemset use wadusappset

Now we would do whatever it takes to have the needed gems properly installed (eg `rake gems:install` or `bundle install`).

Finally, we are going to tell Passenger where to find the gems. To find that place run:

    rvm ree@wadusappset; rvm gemdir

And apply this formula:

    GEM_HOME=`rvm ree@wadusappset; rvm gemdir`
    GEM_PATH=$GEM_HOME:$GEM_PATH

Now, those environment values are set through the apache `mod_env` module:

    <VirtualHost *:80>
      ServerName www.wadusapp.com
  
      DocumentRoot /var/www/wadusapp/current/public
  
      SetEnv GEM_HOME /home/user/.rvm/gems/ree-1.8.7-2010.01@wadusappset
      SetEnv GEM_PATH /home/user/.rvm/gems/ree-1.8.7-2010.01@wadusappset:/home/user/.rvm/gems/ree-1.8.7-2010.01:/home/user/.rvm/gems/ree-1.8.7-2010.01@global
    </VirtualHost>

I did not find a better way of setting the variables so I went with copy & paste.