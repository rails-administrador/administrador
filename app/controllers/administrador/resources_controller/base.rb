module Administrador
  module ResourcesController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ResourcesConcern
      include Administrador::Controller::EngineSidebarConcern
    end
  end
end