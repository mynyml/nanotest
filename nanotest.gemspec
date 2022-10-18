Gem::Specification.new do |s|
  s.name                = "nanotest"
  s.summary             = "When all you need is #assert"
  s.description         = "Extremely minimal test framework. Perfect for DIY lovers. Nanotest provides the bare minimum needed; for everything else, there's ruby."
  s.author              = "Martin Aumont"
  s.email               = "mynyml@gmail.com"
  s.homepage            = "http://github.com/mynyml/nanotest"
  s.license             = "MIT"
  s.rubyforge_project   = "nanotest"
  s.has_rdoc            =  false
  s.require_path        = "lib"
  s.version             = "0.9.4.1"
  s.files               =  File.read("Manifest").strip.split("\n")

  s.add_development_dependency 'minitest'
end
