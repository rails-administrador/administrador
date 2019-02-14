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
      @name.underscore.split("/")
    end

    def model_name
       OpenStruct.new param_key: self.class.name.underscore.gsub('/', '_')
    end

    def translated_name
      I18n.t("classes.#{engine.name.underscore}")
    end

    def router_name
      @name.deconstantize.underscore.gsub('/', '_')
    end

    def configuration
      "#{@name.deconstantize}::Configuration".constantize
    end

    def resources_controllers
      if configuration.respond_to?(:registered_controllers)
        configuration.registered_controllers.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine.name.deconstantize} either does not define a Configuration class or the class #{engine.name.deconstantize}::Configuration does not respond_to :registered_controllers.")
        []
      end
    end

    def service_controllers
      if configuration.respond_to?(:registered_services)
        configuration.registered_services.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine.name.deconstantize} either does not define a Configuration class or the class #{engine.name.deconstantize}::Configuration does not respond_to :registered_services.")
        []
      end
    end
  end
end