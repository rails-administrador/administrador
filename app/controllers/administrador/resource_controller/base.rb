module Administrador
  module ResourceController
    class Base < Administrador::ApplicationController
      include Administrador::Controller::ResourceConcern
    end
  end
end