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

  resources :lessons, :only => [] do
    resources :exams
  end

  resources :subscriptions, :only => [:create, :update] do
    resources :exams, :only => [] do
      resources :grades, :except => [:destroy]
    end
  end

  # match '/grade_exam/:exam_id/:subscription_id' => 'grades#create', :as => 'take_exam', :via => :post

end