require "coffee-rails"
require "sass-rails"
require "haml-rails"
require "route_translator"
require "rao-query"
require "rao-component"
require "rao-view_helper"
require "rao-resource_controller"
require "rao-resources_controller"
require "rao-service"
require "rao-service_controller"
require "simple_form"
require "simple_form-datetimepicker"
require "simple_sidebar"
require "bootstrap4-kaminari-views"
require "rails-i18n"
require "administrador/feature"
require "administrador/configuration"
require "administrador/engine"
require "administrador/registered_engine"

module Administrador
  extend Configuration

  register_engine('Administrador::Engine', show_in_engine_sidebar: false)
end
