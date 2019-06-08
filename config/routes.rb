Rails.application.routes.draw do
  resources :products, only: [:index]

  resources :cart_items, only: [:index, :create]

  get '/cart', to: 'cart_items#index'

  root 'products#index'
end
