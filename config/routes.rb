Rails.application.routes.draw do
  root to: "about#index"

  # users + auth
  resources :users, :sessions
  get "signup",   to: "users#new",        as: "signup"
  get "signin",   to: "sessions#new",     as: "signin"
  get "signout",  to: "sessions#destroy", as: "signout"
  get "profile", to: "users#edit",       as: "profile"
  # post types
  resources :articles, :bookmarks, :notes, :photos, :sounds, :videos

  # settings
  resources :settings
end
