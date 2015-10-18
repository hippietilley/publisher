Rails.application.routes.draw do
  root to: "posts#index"

  # users + auth
  resources :users, :sessions
  get "signup", to: "users#new", as: "signup"
  get "signin", to: "sessions#new", as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"
  get "profile", to: "users#edit", as: "profile"

  # atom feeds
  get "/feed", to: "posts#index", defaults: {format: "atom"}, as: :feed
  get "/articles/feed", to: "articles#index", defaults: {format: "atom"}, as: :articles_feed
  get "/bookmarks/feed", to: "bookmarks#index", defaults: {format: "atom"}, as: :bookmarks_feed
  get "/notes/feed", to: "notes#index", defaults: {format: "atom"}, as: :notes_feed
  get "/photos/feed", to: "photos#index", defaults: {format: "atom"}, as: :photos_feed
  get "/sounds/feed", to: "sounds#index", defaults: {format: "atom"}, as: :sounds_feed
  get "/videos/feed", to: "videos#index", defaults: {format: "atom"}, as: :videos_feed

  # post types
  resources :articles, :bookmarks, :notes, :photos, :sounds, :videos

  # settings
  resources :settings
end
