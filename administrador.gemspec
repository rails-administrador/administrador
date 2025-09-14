$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "administrador/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "administrador"
  s.version     = Administrador::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["info@beegoodit.de"]
  s.homepage    = "https://github.com/robotex82/administrador"
  s.summary     = "Administrador - The rails administration interface."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = '>= 3.4.5'

  s.add_dependency "rails", ">= 8.0"
  s.add_dependency "bootstrap4-kaminari-views"
  s.add_dependency "coffee-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "rails-i18n"
  s.add_dependency "rao-component",            ">= 0.0.52.pre"
  s.add_dependency "rao-query",                ">= 0.0.52.pre"
  s.add_dependency "rao-resources_controller", ">= 0.0.52.pre"
  s.add_dependency "rao-service_controller",   ">= 0.0.52.pre"
  s.add_dependency "rao-view_helper",          ">= 0.0.52.pre"
  s.add_dependency "route_translator"
  s.add_dependency "simple_form-datetimepicker", ">= 0.0.1"
  s.add_dependency "simple_form"
  s.add_dependency "simple_sidebar", ">= 0.0.6.pre"
  s.add_dependency "turbo-rails"
end
