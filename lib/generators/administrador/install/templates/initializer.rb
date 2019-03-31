Administrador.configure do |config|
  # Methods, that will be tried on a resource to generate a nice title
  #
  # Default: config.resource_label_methods = [:administrador_title, :human, :name, :identifier, :to_s]
  #
  config.resource_label_methods = [:administrador_title, :human, :name, :identifier, :to_s]

  # config.register_engine 'Ecm::Blog::Backend::Engine', {}

  # config.base_controller_class_name = '::ApplicationController'
end
