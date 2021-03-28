module Administrador
  class SettingsServicesController < ServiceController::Base
    def self.service_class
      Administrador::SettingsService
    end

    private

    def permitted_params
      params.require(:settings_service).permit(:theme)
    end

    def initialize_service_for_create
      super
      @service.cookies = request.cookies
    end

    def after_success_location
      last_location
    end
  end
end