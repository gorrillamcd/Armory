Armory::Application.routes.draw do

  get 'users/index'

  devise_for :users, :path_prefix => 'd'
  resources :users do
    resources :payments, :except => [:index,:destroy]
  end

  resources :payments, :only => :index

  # To route High-Voltage pages use:
  #  match 'pages/home' => 'high_voltage/pages#show', :id => 'home'
  # or for root
  #  root :to => 'high_voltage/pages#show', :id => 'home'
  match "/pages/*id" => 'pages#show', :as => :page, :format => false
  root :to => 'pages#show', :id => 'home'

  get "/dashboard" => 'dashboard#show'
  
  resources :courses do
    resources :lessons
    resources :books
  end

  resources :lessons do
    resources :exams
  end

  resources :exams do
    resources :grades
  end

  resources :subscriptions, :only => [:create, :update]

end