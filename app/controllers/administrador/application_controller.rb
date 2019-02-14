module Administrador
  class ApplicationController < Administrador::Configuration.base_controller_class_name.constantize
    include Administrador::Controller::ApplicationConcern
    # module FooConcern
    #   extend ActiveSupport::Concern

    #   included do
    #     view_helper Administrador::ApplicationViewHelper, as: :administrador_helper
    #     view_helper Administrador::OffcanvasViewHelper,   as: :offcanvas
    #     view_helper Administrador::BreadcrumbsViewHelper, as: :breadcrumbs

    #     prepend Administrador::EngineRoutable::LocalizedConcern
    #   end
    # end
    # include FooConcern

    # module ItsfBackendCompatibilityConcern
    #   extend ActiveSupport::Concern

    #   included do
    #     helper_method :itsf_backend_path
    #   end

    #   def itsf_backend_path
    #     administrador_path
    #   end
    # end

    # include ItsfBackendCompatibilityConcern
  end
end
