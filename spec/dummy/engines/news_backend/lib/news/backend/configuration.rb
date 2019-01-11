module News
  module Backend
    module Configuration        
      def configure
        yield self
      end

      mattr_accessor :registered_controllers do
        lambda do
          [
            News::Backend::CategoriesController,
            News::Backend::ItemsController
          ]
        end
      end

      mattr_accessor :registered_services do
        lambda do
          []
        end
      end
    end
  end
end