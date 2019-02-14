News::Backend::Engine.routes.draw do
  resources :categories
  resources :items

  root to: 'home#index'
end