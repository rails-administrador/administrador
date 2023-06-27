Administrador.configure do |config|
  # Methods, that will be tried on a resource to generate a nice title
  #
  # Default: config.resource_label_methods = [:administrador_title, :human, :name, :identifier, :email, :to_s]
  #
  config.resource_label_methods = [:administrador_title, :human, :name, :identifier, :email, :to_s]

  # All controllers (for resources, services, sidebars, home, etc.) inherit
  # from this controller.
  #
  # Default: config.base_controller_class_name = '::ApplicationController'
  #
  config.base_controller_class_name = '::ApplicationController'

  # Initial state of the engine sidebar. Can be :open or :closed.
  #
  # Default: config.initial_engine_sidebar_state = :closed
  #
  config.initial_engine_sidebar_state = :closed

  # Enable additional features here.
  #
  # config.enable_feature(:kaminari, { per_page_default: 10 })
  # config.enable_feature(:rao_query, {})

  # Engines that are registered will be shown in the administrador main menu
  # sidebar. Additionally they can register sidebars.
  #
  # config.register_engine 'Cmor::Blog::Backend::Engine', {}
end
