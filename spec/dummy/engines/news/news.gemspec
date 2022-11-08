$:.push File.expand_path("lib", __dir__)


# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "news"
  s.version     = '0.0.1'
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["info@beegoodit.de"]
  s.homepage    = "https://github.com/robotex82/administrador"
  s.summary     = "News."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency 'factory_bot_rails'
end
