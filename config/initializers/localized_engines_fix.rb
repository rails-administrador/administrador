Rails.application.config.to_prepare do
  ActionView::Base.send(:prepend, Administrador::EngineRoutable::LocalizedConcern)
end