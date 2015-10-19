Rails.application.routes.draw do
  root to: "posts#index"

  # users + auth
  resources :users, :sessions
  get "signup", to: "users#new", as: "signup"
  get "signin", to: "sessions#new", as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"
  get "profile", to: "users#edit", as: "profile"

  # RSS/Atom feeds
  get "/feed", to: "posts#index", defaults: {format: "atom"}, as: :feed
  get "/articles/feed", to: "articles#index", defaults: {format: "atom"}, as: :articles_feed
  get "/bookmarks/feed", to: "bookmarks#index", defaults: {format: "atom"}, as: :bookmarks_feed
  get "/notes/feed", to: "notes#index", defaults: {format: "atom"}, as: :notes_feed
  get "/photos/feed", to: "photos#index", defaults: {format: "atom"}, as: :photos_feed
  get "/sounds/feed", to: "sounds#index", defaults: {format: "atom"}, as: :sounds_feed
  get "/videos/feed", to: "videos#index", defaults: {format: "atom"}, as: :videos_feed

  # Notes CRUD
  get "/notes/new", to: "notes#new", as: "new_note"
  post "/notes", to: "notes#create", as: "notes"
  post "/notes/:year/:month/:day", to: "notes#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/notes/:year/:month/:day/:slug", to: "notes#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "note"
  get "/notes/:year/:month/:day/:slug/edit", to: "notes#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_note"
  patch "/notes/:year/:month/:day/:slug", to: "notes#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/notes/:year/:month/:day/:slug", to: "notes#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Notes Pagination
  get "/notes/page/1",                    to: redirect("/notes")
  get "/notes/page",                      to: redirect("/notes")
  get "/notes/page/:page",                to: "notes#index", constraints: {page: /\d+/}
  get "(/notes)(/:year)(/:month)(/:day)", to: "notes#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # post types
  resources :articles, :bookmarks, :photos, :sounds, :videos

  # settings
  resources :settings, only: [:index, :edit, :update]
end
