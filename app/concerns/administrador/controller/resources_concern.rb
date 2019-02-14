module Administrador
  module Controller
    module ResourcesConcern
      extend ActiveSupport::Concern

      include Rao::ResourcesController::RestActionsConcern
      include Rao::ResourcesController::ResourcesConcern
      include Rao::ResourcesController::RestResourceUrlsConcern
      include Rao::ResourcesController::ResourceInflectionsConcern
      include Rao::ResourcesController::LocationHistoryConcern
      include Rao::ResourcesController::SortingConcern
      include Rao::ResourcesController::BatchActionsConcern
      include Rao::ResourcesController::KaminariConcern if Administrador.features?(:kaminari)
      include Rao::Query::Controller::QueryConcern if Administrador.features?(:rao_query)

      included do
        helper Rao::Component::ApplicationHelper
        view_helper Rao::Query::ApplicationHelper , as: :query_helper if Administrador.features?(:rao_query)
      end

      def load_collection_scope
        with_conditions_from_query(resource_class)
      end if Administrador.features?(:rao_query)


      module ResourcesCountConcern
        extend ActiveSupport::Concern
        module ClassMethods
          def resource_count
            resource_class.count
          end
        end
      end
      include ResourcesCountConcern

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
            %i(create new show edit update delete list)
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