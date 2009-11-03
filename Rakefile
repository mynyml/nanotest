# --------------------------------------------------
# Gem
# --------------------------------------------------
def gemspec
  @gemspec ||= Gem::Specification.new do |s|
    s.name                = "nanotest"
    s.summary             = "When all you need is #assert"
    s.description         = "Extremely mynymal test framework. Perfect for DIY lovers. NanoTest provides the bare mynymum needed; for everything else, there's ruby."
    s.author              = "Martin Aumont"
    s.email               = "mynyml@gmail.com"
    s.homepage            = "http://github.com/mynyml/nanotest"
    s.rubyforge_project   = "nanotest"
    s.has_rdoc            =  false
    s.require_path        = "lib"
    s.version             = "0.9.2"
    s.files               =  File.read("Manifest").strip.split("\n")

    s.add_development_dependency 'minitest'
  end
end

desc "Create a Ruby GEM package with the given name and version."
task(:gem) do
  file = Gem::Builder.new(gemspec).build
  FileUtils.mkdir 'pkg/' unless File.directory? 'pkg'
  FileUtils.mv file, "pkg/#{file}", :verbose => true
end

desc "Create gemspec file"
task(:gemspec) do
  open("#{gemspec.name}.gemspec", 'w') {|f| f << YAML.dump(gemspec) }
end

# --------------------------------------------------
# Tests
# --------------------------------------------------
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
    versions = %w(  1.8.6  1.8.7  1.9  1.9.2  jruby  jruby\ -v\ 1.4.0RC1  )
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
    File.read(file).each_line do |line|
      loc += 1 unless line.strip.empty? || line.strip =~ /^#/
    end
  end
  puts "lib files contain #{loc} SLOCs"
end

