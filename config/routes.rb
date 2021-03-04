Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  get "/get_current_user", to: "sessions#get_current_user" 
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"

  post "/movies", to: "movies#create"

  post "/user_movies", to: "user_movies#create"

  resources :movies
  resources :users
  resources :user_movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  