require "coffee-rails"
require "haml-rails"
require "route_translator"
require "rao-query"
require "rao-component"
require "rao-view_helper"
require "rao-resource_controller"
require "rao-resources_controller"
require "rao-service_controller"
require "simple_form"
require "bootstrap4-kaminari-views"
require "rails-i18n"
require "administrador/feature"
require "administrador/configuration"
require "administrador/engine"
require "administrador/registered_engine"

module Administrador
  extend Configuration
end
