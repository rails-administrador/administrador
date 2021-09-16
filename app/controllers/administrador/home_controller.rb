module Administrador
  class HomeController < Administrador::ApplicationController
    include Controller::EngineSidebarConcern

    def index
    end
  end
end