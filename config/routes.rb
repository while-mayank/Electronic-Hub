Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", confirmations: 'users/confirmations'}
  root to: "homes#index"
  
  resources :profiles
  resources :products
end
