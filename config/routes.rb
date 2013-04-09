Cuppa::Application.routes.draw do
  resources :locations


    namespace :mercury do
      resources :images
    end

  mount Mercury::Engine => '/'

  get "help/demo"

  root :to => "courses#index"
  resources :registrations do
    get "certificate", on: :member
  end

  resources :registrations do
    member do
    put :toggle
    end
  end

  resources :courses
  resources :users
  resources :sessions
  resources :registrations
  

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  end
