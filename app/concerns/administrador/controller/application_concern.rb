module Administrador
  module Controller
    module ApplicationConcern
      extend ActiveSupport::Concern

      included do
        view_helper Administrador::ApplicationViewHelper, as: :administrador_helper
        view_helper Administrador::BreadcrumbsViewHelper, as: :breadcrumbs

        prepend Administrador::EngineRoutable::LocalizedConcern
      end
    end
  end
end