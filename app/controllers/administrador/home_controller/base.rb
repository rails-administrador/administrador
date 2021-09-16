module Administrador
  class HomeController::Base < ApplicationController
    include Administrador::Controller::EngineConcern
    include Administrador::Controller::EngineSidebarConcern

    def index; end
  end
end