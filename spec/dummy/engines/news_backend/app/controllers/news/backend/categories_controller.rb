module News
  module Backend
    class CategoriesController < Administrador::ResourcesController::Base
      def self.resource_class
        News::Category
      end
    end
  end
end
