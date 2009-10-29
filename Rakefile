# --------------------------------------------------
# Gem
# --------------------------------------------------
def gemspec
  @gemspec ||= Gem::Specification.new do |s|
    s.name                = "nanotest"
    s.summary             = "Out of my way, test framework!"
    s.description         = "Most. Miminal. Test Framework. Ever! Perfect for DIY lovers."
    s.author              = "Martin Aumont"
    s.email               = "mynyml@gmail.com"
    s.homepage            = "http://github.com/mynyml/nanotest"
    s.rubyforge_project   = "nanotest"
    s.has_rdoc            =  false
    s.require_path        = "lib"
    s.version             = "0.9"
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
    cmd = "ruby -rubygems -Ilib -e'%w( #{tests.join(' ')} ).each {|file| require file }'"
    puts(cmd) if ENV['VERBOSE']
    system(cmd)
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
