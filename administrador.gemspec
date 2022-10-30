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

  s.required_ruby_version = '>= 2.6.6'

  s.add_dependency "rails", ">= 6.1"
  s.add_dependency "coffee-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "rao-query",                ">= 0.0.33.pre"
  s.add_dependency "rao-component",            ">= 0.0.46.pre"
  s.add_dependency "rao-resource_controller",  ">= 0.0.23.pre"
  s.add_dependency "rao-resources_controller", ">= 0.0.47.pre"
  s.add_dependency "rao-service_controller",   ">= 0.0.47.pre"
  s.add_dependency "rao-view_helper",          ">= 0.0.48.pre"
  s.add_dependency "route_translator"
  s.add_dependency "simple_form"
  s.add_dependency "simple_form-datetimepicker", ">= 0.0.1"
  s.add_dependency "simple_sidebar", ">= 0.0.6.pre"
  s.add_dependency "bootstrap4-kaminari-views"
  s.add_dependency "rails-i18n"

  s.add_development_dependency "sqlite3", "~> 1.4"
  s.add_development_dependency "capybara-screenshot"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "launchy"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "responders"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
end
