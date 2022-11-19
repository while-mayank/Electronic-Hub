Rails.application.routes.draw do
  
  get 'homes/index'
  resources :profiles
  resources :products
  
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "products#index"
end
