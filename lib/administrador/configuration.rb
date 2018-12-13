module Administrador
  module Configuration
    def configure
      yield self
    end
  end
end
