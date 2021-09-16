module Administrador
  module ResourceController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ResourceConcern
      include Administrador::Controller::EngineSidebarConcern
    end
  end
end