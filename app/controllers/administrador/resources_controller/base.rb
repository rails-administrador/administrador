module Administrador
  module ResourcesController
    class Base < ApplicationController
      include Administrador::Controller::ResourcesConcern
    end
  end
end