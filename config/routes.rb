Rails.application.routes.draw do
  
  resources :profiles
  resources :products
  
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "home#index"
end
