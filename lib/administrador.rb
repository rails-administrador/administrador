require "bootstrap4-kaminari-views"
require "coffee-rails"
require "haml-rails"
require "rails-i18n"
require "rao-component"
require "rao-query"
require "rao-resource_controller"
require "rao-resources_controller"
require "rao-service_controller"
require "rao-view_helper"
require "route_translator"
require "simple_form-datetimepicker"
require "simple_form"
require "simple_sidebar"
require "turbo-rails"

require "administrador/version"
require "administrador/feature"
require "administrador/configuration"
require "administrador/engine"
require "administrador/registered_engine"

module Administrador
  extend Configuration
end
