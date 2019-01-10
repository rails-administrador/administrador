module Administrador
  class ApplicationController < ActionController::Base
    view_helper Administrador::ApplicationViewHelper, as: :administrador_helper
    view_helper Administrador::OffcanvasViewHelper,   as: :offcanvas
    view_helper Administrador::BreadcrumbsViewHelper, as: :breadcrumbs
  end
end
