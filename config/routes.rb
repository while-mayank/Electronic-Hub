Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", confirmations: 'users/confirmations'}
  root to: "homes#index"
  
  resources :profiles
  resources :products
  resources :orders
  resources :addresses
  
  resources :cart_items do 
    member do
      get 'increment'
      get 'decrement'
      post 'register'
    end
  end

  resources :order_items do 
    member do
      post 'generate'
    end
  end

end
