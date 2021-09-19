module Administrador
  class Feature
    attr_reader :options

    def initialize(name, options = {})
      @name, @options = name, options
    end
  end
end