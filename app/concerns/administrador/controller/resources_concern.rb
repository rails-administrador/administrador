module Administrador
  module Controller
    module ResourcesConcern
      extend ActiveSupport::Concern

      include Rao::ResourcesController::RestActionsConcern
      include Rao::ResourcesController::ResourcesConcern
      include Rao::ResourcesController::RestResourceUrlsConcern
      include Rao::ResourcesController::ResourceInflectionsConcern
      include Rao::ResourcesController::LocationHistoryConcern

      included do
        helper Rao::Component::ApplicationHelper
      end
    end
  end
end