Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  get "/current_user", to: "sessions#get_current_user" 
  
  resources :movies
  resources :users
  resources :user_movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  