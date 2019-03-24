Rails.application.routes.draw do
  localized do
    mount Administrador::Engine, at: "/administrador-engine"
  end
  mount Blorgh::Engine, at: "/blorgh"
  mount News::Backend::Engine, at: "/news-backend"
end
