module Administrador
  module Controller
    module EngineConcern
      extend ActiveSupport::Concern

      included do
        helper_method :engine_class
      end

      class_methods do
        def engine_class
          "#{name.deconstantize}::Engine".constantize
        end
      end

      def engine_class
        self.class.engine_class
      end
    end
  end
end