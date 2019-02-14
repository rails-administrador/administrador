module Administrador
  module Controller
    module ServiceConcern
      extend ActiveSupport::Concern

      include Rao::ServiceController::RestActionsConcern
      include Rao::ServiceController::ServiceConcern
      include Rao::ServiceController::RestServiceUrlsConcern
      include Rao::ServiceController::ServiceInflectionsConcern
      include Rao::ServiceController::LocationHistoryConcern

      included do
        helper Rao::Component::ApplicationHelper
      end
    end
  end
end