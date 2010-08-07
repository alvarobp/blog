desc "deploy site to blog.inbatu.com"
task :deploy do
  require 'rubygems'
  require 'highline/import'
  require 'net/ssh'
  
  branch = "master"
  
  username = ask("Username: ") { |q| q.echo = true }
  password = ask("Password: ") { |q| q.echo = false }
  
  Net::SSH.start('blog.inbatu.com', username, :password => password) do |ssh|
    commands = <<EOF
cd /var/www/blog/
if [ ! -d cached-copy ]; then git clone git://github.com/alvarobp/blog.inbatu.com.git cached-copy; cd cached-copy;#{"git checkout -b #{branch} --track origin/#{branch} ;" unless branch == "master"} cd .. ; fi
cd cached-copy
git checkout #{branch}
git pull origin #{branch}
git checkout -f
rm -rf _site
jekyll --no-auto
mv _site ../_#{branch}
mv ../#{branch} _old
mv ../_#{branch} ../#{branch}
rm -rf _old
cd ../#{branch}
if [ -e ../cached-copy/.deleteondeploy ]; then cat ../cached-copy/.deleteondeploy | xargs rm -r; fi
EOF
    commands = commands.gsub(/\n/, "; ")
    ssh.exec commands
  end
end
