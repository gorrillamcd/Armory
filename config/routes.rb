Armory::Application.routes.draw do

  devise_for :users

  root :to => 'courses#index'

  resources :courses do
    resources :lessons
    resources :exams
    resources :books
  end

  resources :questions

end