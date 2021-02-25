Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  get "/get_current_user", to: "sessions#get_current_user" 
  post "/logout", to: "sessions#destroy"
  
  resources :movies
  resources :users
  resources :user_movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  