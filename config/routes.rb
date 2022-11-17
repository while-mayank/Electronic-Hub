Rails.application.routes.draw do
  resources :profiles
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "home#index"
end
