Administrador.configure do |config|
  config.register_engine 'Blorgh::Engine', {}
  config.register_engine 'News::Backend::Engine', {}
end
