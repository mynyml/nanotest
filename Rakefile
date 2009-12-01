# --------------------------------------------------
# Tests
# --------------------------------------------------
task(:default => "test:all")

namespace(:test) do

  desc "Run all tests"
  task(:all) do
    tests = Dir['test/**/test_*.rb'] - ['test/test_helper.rb']
    cmd = "ruby -rubygems -I.:lib -e'%w( #{tests.join(' ')} ).each {|file| require file }'"
    puts(cmd) if ENV['VERBOSE']
    system(cmd)
  end

  desc "Run all tests on multiple ruby versions (requires rvm)"
  task(:portability) do
    versions = %w(  1.8.6  1.8.7  1.9  1.9.2  jruby  )
    versions.each do |version|
      system <<-BASH
        bash -c 'source ~/.rvm/scripts/rvm;
                 rvm use #{version};
                 echo "--------- #{version} ----------";
                 rake -s test:all'
      BASH
    end
  end
end

# --------------------------------------------------
# Docs
# --------------------------------------------------
desc "Generate YARD Documentation"
task :yardoc do
  require 'yard'
  files   = %w( lib/**/*.rb )
  options = %w( -o doc/yard --readme README.rdoc --files LICENSE )
  YARD::CLI::Yardoc.run *(options + files)
end

# --------------------------------------------------
# Stats
# --------------------------------------------------
desc "LOC count"
task(:loc) do
  loc = 0
  Dir['lib/**/*'].each do |file|
    next if File.directory?(file)
    File.read(file).each_line do |line|
      loc += 1 unless line.strip.empty? || line.strip =~ /^#/
    end
  end
  puts "lib contain #{loc} SLOCs"
end

