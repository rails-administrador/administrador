module News
  module Backend
    class ItemsController < Administrador::ResourcesController::Base
      def self.resource_class
        News::Item
      end

      private

      def permitted_params
        params.require(:item).permit(:title, :body, :published_at, :category_id)
      end
    end
  end
end
