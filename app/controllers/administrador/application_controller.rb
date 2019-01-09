module Administrador
  class ApplicationController < ActionController::Base
    view_helper Administrador::ApplicationViewHelper, as: :administrador
  end
end
