module Administrador
  module Configuration
    def configure
      yield self
    end

    mattr_accessor(:engines) { {} }

    def register_engine(name, options = {})
      @@engines[name] = Administrador::RegisteredEngine.new(name, options)
    end
  end
end
