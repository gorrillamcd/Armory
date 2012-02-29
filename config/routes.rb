Armory::Application.routes.draw do

  root :to => 'courses#index'
  resources :courses
  resources :lessons
  resources :exams

end