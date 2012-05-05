desc "deploy site to blog.alvarobp.com"
task :deploy do
  require 'fileutils'
  require 'highline/import'
  require 'net/ssh'
  require 'net/scp'

  host = 'blog.alvarobp.com'
  project_root_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  tmp_path = File.join(project_root_path, 'tmp')
  tmp_site_path = File.join(tmp_path, 'site')
  package_name = "blog-site.tar.gz"
  package_path = File.join(tmp_path, package_name)
  deploy_path = ENV['DEPLOY_PATH'] || '/var/www/blog'
  release_time = Time.now.strftime('%Y%m%d%H%M%S')
  release_path = File.join(deploy_path, release_time)

  FileUtils.mkdir_p(tmp_path)
  FileUtils.rm_r(tmp_site_path) if File.exists?(tmp_site_path)
  system("bundle exec jekyll --no-auto #{tmp_site_path}")
  system("cd #{tmp_site_path}; tar cvfz #{package_path} * &> /dev/null")
  FileUtils.rm_r(tmp_site_path)

  username = ENV['REMOTE_USER'] or ask("Remote user: ") { |q| q.echo = true }
  ssh_options = {}

  if key_path = ENV['SSH_KEY']
    ssh_options.merge :key_data => File.read(key_path)
  else
    password = ask("Remote password: ") { |q| q.echo = false }
    ssh_options.merge :password => password
  end

  Net::SSH.start(host, username, ssh_options) do |ssh|
    ssh.exec "mkdir -p #{release_path}"

    scp = Net::SCP.new(ssh)
    puts 'Uploading package...'
    scp.upload! package_path, release_path

    puts 'Extracting package...'
    ssh.exec "cd #{release_path}; tar xvfz #{package_name} &> /dev/null; rm #{package_name}"
    puts 'Linking release...'
    ssh.exec "[[ -e #{deploy_path}/current ]] && rm #{deploy_path}/current; ln -s #{release_path} #{deploy_path}/current"
  end
end
