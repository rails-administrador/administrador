module Administrador
  module Controller
    module ResourceConcern
      extend ActiveSupport::Concern

      include Rao::ResourceController::RestActionsConcern
      include Rao::ResourceController::ResourceConcern
      include Rao::ResourceController::RestResourceUrlsConcern
      include Rao::ResourceController::ResourceInflectionsConcern
      include Rao::ResourceController::LocationHistoryConcern

      included do
        helper Rao::Component::ApplicationHelper
      end

      # You can exclude available actions so that buttons to that action are not included
      # in the UI.
      #
      # Example:
      #
      #     # app/controllers/posts_controller.rb
      #     class PostsController < ApplicationController
      #       include Administrador::Controller::ResourcesConcern
      #
      #       def self.available_rest_actions
      #         super - %i(edit new)
      #       end
      #     end
      module AvailableRestActionsConcern
        extend ActiveSupport::Concern

        included do
          helper_method :available_rest_actions
        end

        module ClassMethods
          def available_rest_actions
            %i(new create show edit update destroy)
          end
        end

        def available_rest_actions
          self.class.available_rest_actions
        end
      end

      include AvailableRestActionsConcern
    end
  end
end