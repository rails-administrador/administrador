module Administrador
  # A registered engine represents a rails engine that is registered to
  # administrador.
  #
  # You can register an engine as follows:
  #
  #     # blorgh/app/config/initializers/administrador.rb
  #     Administrador.configure { |c| c.register_engine(Blorgh::Engine', {}) }
  #
  # The register_engine methods accepts an option hash. Available options are:
  #
  #   * show_in_engine_sidebar:
  #       default: true
  #       Controls wether the engine will be shown in the main menu (engine sidebar) or not.
  #
  # A special case is when you want to register your rails application into
  # administrador. You can do that like this:
  #
  #    # app/config/initializers/main_app.rb
  #    require 'example_app/configuration'
  #    Administrador.configure { |c| c.register_engine('ExampleApp::Application', {}) }
  #
  # You will need to add a configuration module:
  #
  #    # lib/example_app/configuration.rb
  #    module ExampleApp
  #      module Configuration
  #        # mattr_accessor(:resources_controllers) { ->{[]} }
  #        # mattr_accessor(:resource_controllers)  { ->{[]} }
  #        # mattr_accessor(:service_controllers)   { ->{[]} }
  #        # mattr_accessor(:sidebar_controllers)   { ->{[]} }
  #      end
  #    end
  #
  class RegisteredEngine
    attr_accessor :options, :name

    @store = []

    def self.create(attributes = {})
      @store << new(attributes)
    end

    def self.all
      @store
    end

    def self.find_by_name(name)
      @store.find { |re| re[:name] == name }
    end

    def self.find_by_class(klass)
      @store.find { |re| re.engine_class == klass }
    end

    def self.find_by_class_name(class_name)
      @store.find { |re| re.engine_class.name == class_name }
    end

    def initialize(attributes = {})
      options = attributes.delete(:options)
      options.reverse_merge!(
        show_in_engine_sidebar: true
      )
      attributes.merge(options: options).each do |key, value|
        send("#{key}=", value)
      end
    end

    def engine_class
      @name.constantize
    end

    def main_app?
      engine_class.ancestors.include?(::Rails::Application)
    end

    def to_key
      @name.underscore.split("/")
    end

    def model_name
       OpenStruct.new param_key: self.class.name.underscore.gsub('/', '_')
    end

    def translated_name
      I18n.t("classes.#{engine_class.name.underscore}")
    end

    def router_name
      if main_app?
        :main_app
      else
        @name.deconstantize.underscore.gsub('/', '_')
      end
    end

    def configuration
      "#{@name.deconstantize}::Configuration".constantize
    end

    def resources_controllers
      if configuration.respond_to?(:registered_controllers)
        configuration.registered_controllers.call
      elsif configuration.respond_to?(:resources_controllers)
        configuration.resources_controllers.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine_class.name.deconstantize} either does not define a Configuration class or the class #{engine_class.name.deconstantize}::Configuration does not respond_to :resources_controllers.")
        []
      end
    end

    def resource_controllers
      if configuration.respond_to?(:resource_controllers)
        configuration.resource_controllers.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine_class.name.deconstantize} either does not define a Configuration class or the class #{engine_class.name.deconstantize}::Configuration does not respond_to :resource_controllers.")
        []
      end
    end

    def service_controllers
      if configuration.respond_to?(:registered_services)
        configuration.registered_services.call
      elsif configuration.respond_to?(:service_controllers)
        configuration.service_controllers.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine_class.name.deconstantize} either does not define a Configuration class or the class #{engine_class.name.deconstantize}::Configuration does not respond_to :service_controllers.")
        []
      end
    end

    def sidebar_controllers
      if configuration.respond_to?(:sidebar_controllers)
        configuration.sidebar_controllers.call
      else
        Rails.logger.warn("Administrador: The namespace #{engine_class.name.deconstantize} either does not define a Configuration class or the class #{engine_class.name.deconstantize}::Configuration does not respond_to :sidebar_controllers.")
        []
      end
    end
  end
end