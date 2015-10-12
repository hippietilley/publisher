Rails.application.routes.draw do
  root to: "about#index"

  # users + auth
  resources :users, :sessions
  get "signup",   to: "users#new",        as: "signup"
  get "signin",   to: "sessions#new",     as: "signin"
  get "signout",  to: "sessions#destroy", as: "signout"
  get "settings", to: "users#edit",       as: "settings"
  
  # post types
  resources :articles, :notes, :photos, :videos
end
