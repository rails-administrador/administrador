module Administrador
  class SettingsService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
    end

    attr_accessor :cookies, :theme

    def available_themes
      %i( light dark )
    end

    def theme
      @theme ||= fetch_theme || default_theme
    end

    def fetch_theme
      cookies.fetch(:theme, nil)
    end

    def default_theme
      :light
    end

    private

    def _perform
      cookies[:theme] = @theme
    end
  end
end
