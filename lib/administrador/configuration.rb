module Administrador
  module Configuration
    def configure
      yield self
    end

    mattr_accessor(:features) { {} }
    mattr_accessor(:resource_label_methods) { [:human, :name, :email, :to_s] }
    mattr_accessor(:base_controller_class_name) { '::ApplicationController' }
    mattr_accessor(:initial_engine_sidebar_state) { :closed }

    def self.engines
      Administrador::RegisteredEngine.all
    end

    def register_engine(name, options = {})
      Administrador::RegisteredEngine.create(name: name, options: options)
    end

    def enable_feature(name, options = {})
      @@features[name] = Administrador::Feature.new(name, options)
    end

    def features?(name)
      @@features.has_key?(name)
    end
  end
end
