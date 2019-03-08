module Administrador
  module SidebarController
    class Base < Administrador::ApplicationController
      layout false

      def show
        respond_to do |format|
          format.html
        end
      end
    end
  end
end
