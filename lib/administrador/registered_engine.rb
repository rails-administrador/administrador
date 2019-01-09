module Administrador
  class RegisteredEngine
    attr_accessor :options, :name

    def initialize(name, options)
      @name, @options = name, options
    end

    def engine
      @name.constantize
    end

    def to_key
      @name.underscore
    end
  end
end