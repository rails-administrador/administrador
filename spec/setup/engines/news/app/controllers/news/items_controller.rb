module News
  class ItemsController < Administrador::ResourcesController::Base
    def self.resource_class
      News::Item
    end
  end
end
