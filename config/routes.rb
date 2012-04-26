Armory::Application.routes.draw do

  get "users/index"

  devise_for :users, :path_prefix => 'd'
  resources :users

  root :to => 'courses#index'

  resources :courses do
    resources :lessons
    resources :exams
    resources :books
  end

  resources :questions

end