module Administrador
  class ApplicationViewHelper < Rao::ViewHelper::Base
    def engines
      Administrador::Configuration.engines
    end
  end
end
