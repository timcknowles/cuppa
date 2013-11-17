Cuppa::Application.routes.draw do

  namespace :admin do
    match '/help' => 'pages#help'
    
    get '/dashboard' => "dashboard#index"
    resources :feedback_answers
    resources :feedback_forms
    resources :courses
    resources :course_types do
      resources :feedback_questions
    end
    resources :users #, only: [:index, :show, :edit]
    resources :registrations, only: [:show, :destroy] do
      member do
        put :toggle_paid
      end
    end
  end
  get "/admin" => redirect("/admin/courses")

  get 'terms' => 'pages#terms', :as => 'terms'
  get'privacy' => 'pages#privacy', :as => 'privacy'
  get 'contact' => 'pages#contact'

  resources :registrations do
    resource :feedback_form
    get "certificate", on: :member
  end

  resources :locations
  resources :courses, only: [:index, :show]
  resources :users, except: [:index]
  resources :sessions
  resources :registrations, except: [:destroy]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => "courses#index"
end
