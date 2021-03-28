Administrador::Engine.routes.draw do
  resource :settings_sidebar, only: [:show]

  resources :settings_services, only: [:create]

  root to: 'home#index'
  # localized do
  #   scope :administrador do
  #     root to: 'home#index'
  #   end
  # end
end
