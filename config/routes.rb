Rails.application.routes.draw do
  #root "sessions#welcome"
  root 'about#index'
  get "about", to: "about#index"
  get "posts", to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post "/handle_login", to: "users#validate_login"
  get "/handle_login", to: "users#handle_login"
end
