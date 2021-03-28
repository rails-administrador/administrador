module Administrador
  class SettingsSidebarsController < SidebarController::Base
    def show
      @service = Administrador::SettingsService.new(cookies: request.cookies)
    end
  end
end
