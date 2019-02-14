module Administrador
  class ApplicationController < Administrador::Configuration.base_controller_class_name.constantize
    include Administrador::Controller::ApplicationConcern
  end
end
