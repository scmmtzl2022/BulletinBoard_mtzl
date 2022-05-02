Rails.application.routes.draw do
  #root "sessions#welcome"
  root 'about#index'
  get "about", to: "about#index"
  # for posts
  resources :posts do
    collection do
      get :confirm_create, to: "posts#new"
      post :confirm_create
      get :upload_csv
      post :import_csv
      get :download
    end
    member do
      get :confirm_update, to: "posts#confirm_update"
      post :confirm_update
      post :update_post
    end
  end
  get "/search", to: "posts#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post "/handle_login", to: "users#validate_login"
  get "/handle_login", to: "users#handle_login"
end
