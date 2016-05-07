Rails.application.routes.draw do
  resources :things do
    resources :comments
  end

  root to: 'home#index'
end
