Armory::Application.routes.draw do

  get 'users/index'

  devise_for :users, :path_prefix => 'd'

  resources :users do
    resources :payments
  end

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

  resources :subscriptions
    resources :exams do
      resources :grades, :except => [:index]
    end
  end

  resources :grades, :except => [:new, :create, :edit, :update]

  resources :subscriptions, :only => [:create, :update]

end