$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "administrador/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "administrador"
  s.version     = Administrador::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/administrador"
  s.summary     = "Administrador - The rails administration interface."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
