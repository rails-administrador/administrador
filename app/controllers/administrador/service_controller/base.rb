module Administrador
  module ServiceController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ServiceConcern
    end
  end
end