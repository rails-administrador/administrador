source "https://rubygems.org"

# Specify your gem's dependencies in rao-resources_controller.gemspec.
gemspec

gem "rails", ">= 8.0"

gem "puma"

gem "sqlite3"

gem "propshaft"

# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

group :development, :test do
  gem "bootsnap"
  gem "capybara"
  gem "capybara-screenshot"
  gem "factory_bot_rails"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "launchy"
  gem "pry-rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "simplecov"
end

gem "importmap-rails"
gem "turbo-rails"

# Local rao gems
gem "rao-component", path: "~/projects/gems/rao/rao-component"
gem "rao-query", path: "~/projects/gems/rao/rao-query"
gem "rao-resources_controller", path: "~/projects/gems/rao/rao-resources_controller"
gem "rao-service_controller", path: "~/projects/gems/rao/rao-service_controller"
gem "rao-view_helper", path: "~/projects/gems/rao/rao-view_helper"
gem "simple_sidebar", path: "~/projects/gems/simple_sidebar"
