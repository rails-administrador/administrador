module Administrador
  module SidebarController
    class Base < Administrador::ApplicationController
      layout false

      def self.icon_name; end
      def self.sidebar_position; end
      def self.sidebar_size; end
      def self.sidebar_url; end
      def self.sidebar_mode; end

      def show
        respond_to do |format|
          format.html
        end
      end
    end
  end
end
