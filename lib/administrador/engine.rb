module Administrador
  class Engine < ::Rails::Engine
    isolate_namespace Administrador

    initializer "administrador.importmap", before: "importmap" do |app|
      if defined?(Importmap)
        puts "[Administrador] Adding importmap paths"
        app.config.importmap.paths << root.join("config/importmap.rb")
        app.config.importmap.cache_sweepers << root.join("app/javascript")
      end
    end

    # Ensure asset server (Propshaft/Sprockets) can find JS files
    initializer "administrador.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
    end
  end
end
