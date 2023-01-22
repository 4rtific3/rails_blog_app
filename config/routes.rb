Rails.application.routes.draw do
  
  root to: "pages#home"
  resources :articles
  get "signup", to: "users#new"
  # post "users", to: "users#create"
  resources :users, except: [:new]
end
