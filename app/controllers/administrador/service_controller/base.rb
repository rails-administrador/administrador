module Administrador
  module ServiceController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ServiceConcern
      include Administrador::Controller::EngineSidebarConcern
    end
  end
end