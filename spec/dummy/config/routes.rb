Rails.application.routes.draw do
  mount Administrador::Engine, at: "/"
  mount Blorgh::Engine, at: "/blorgh"
  mount News::Backend::Engine, at: "/news-backend"
end
