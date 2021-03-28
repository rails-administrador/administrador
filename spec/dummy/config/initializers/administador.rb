Administrador.configure do |config|
  config.default_theme = :dark
  config.register_engine 'Blorgh::Engine', {}
  config.register_engine 'News::Backend::Engine', {}
end
