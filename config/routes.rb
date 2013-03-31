Cuppa::Application.routes.draw do
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
  
end
