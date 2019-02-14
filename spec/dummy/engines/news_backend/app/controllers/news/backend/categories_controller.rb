module News
  module Backend
    class CategoriesController < Administrador::ResourcesController::Base
      def self.resource_class
        News::Category
      end
      private

      def permitted_params
        params.require(:category).permit(:identifier)
      end
    end
  end
end
