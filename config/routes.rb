Administrador::Engine.routes.draw do
  localized do
    scope :administrador do
      root to: 'home#index'
    end
  end
end
