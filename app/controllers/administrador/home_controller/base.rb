module Administrador
  class HomeController::Base < ApplicationController
    include Administrador::Controller::EngineConcern

    def index; end
  end
end