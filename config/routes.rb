Cuppa::Application.routes.draw do
  get "help/demo"

  root :to => "courses#index"
  resources :registrations do
    get "certificate", on: :member
  end

  resources :courses
  resources :users
  resources :sessions

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "user" => "users#index", :as => "user"
  end
