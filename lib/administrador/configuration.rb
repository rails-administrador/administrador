module Administrador
  module Configuration
    def configure
      yield self
    end

    def register_engine(name, options = {})
      (@engines || {})[name] = options
    end
  end
end
