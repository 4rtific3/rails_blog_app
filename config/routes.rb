Rails.application.routes.draw do
  
  root to: "pages#home"
  resources :articles
  get "signup", to: "users#new"
  # post "users", to: "users#create"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :categories, execpt: [:destroy]
end
