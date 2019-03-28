[![Travis CI](https://travis-ci.org/rails-administrador/administrador.svg?branch=master)](https://travis-ci.org/rails-administrador/administrador)

# Administrador

Yet another rails admin UI.

Why do we need another one?

Most admin UIs need to be hacked or bent to support engines. This admin UI thinks
engines first, main-app second. ;)

## Philosophy

Administrador thinks in engines, resources and services.

## Prerequisites

If you are using rails <= 4.0 you have to add the responders gem to you Gemfile:

```ruby
gem 'responders'
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'administrador'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install administrador
```

Run the rails generator:
```bash
$ rails g administrador:install
```

## Configuration

Look at the initializer at config/initializers/administrador.rb for configuration
options.

### Adding and engine to administrador

```ruby
Administrador.configure do |config|
  config.register_engine 'Blorgh::Engine', {}
end
```
### Stylesheets and Javascripts

Administrador assumes, that you have an application.js and application.css in your engine.
For example if you have a Blorgh-Engine, you should have following files inside the engine:

/app/assets/javascripts/blorgh/application.js
/app/assets/stylesheets/blorgh/application.css

## Usage

Go to /en/backend and enjoy your admin UI.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
