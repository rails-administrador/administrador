module Administrador
  module ResourcesController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ResourcesConcern
    end
  end
end