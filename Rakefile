Dir["#{File.dirname(__FILE__)}/tasks/**/*.rake"].sort.each { |ext| load ext }

task :compile_js do
  config = YAML.load_file("#{File.dirname(__FILE__)}/_config.yml")
  javascript_files = config["javascripts"].map{|fn| "--js #{fn} "}.join
  
  system "cd #{File.dirname(__FILE__)}/javascripts; java -jar /usr/local/bin/closure_compiler.jar #{javascript_files} --js_output_file compiled.js"
end