Rails.application.routes.draw do
  resources :articles
  resources :notes
  root to: "about#index"

  # auth
  resources :users
  resources :sessions
  get "signup",  to: "users#new",        as: "signup"
  get "signin",  to: "sessions#new",     as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"

  # users
  get "settings", to: "users#edit", as: "settings"
end
