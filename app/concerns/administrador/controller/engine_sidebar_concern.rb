module Administrador
  module Controller
    module EngineSidebarConcern
      extend ActiveSupport::Concern

      included do
        helper_method :initial_engine_sidebar_state
      end

      private

      def initial_engine_sidebar_state
        Administrador::Configuration.initial_engine_sidebar_state
      end
    end
  end
end
