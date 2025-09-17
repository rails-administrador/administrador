News::Engine.routes.draw do
  resources :items
  root to: 'home#index'
end
