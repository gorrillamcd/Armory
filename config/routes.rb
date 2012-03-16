Armory::Application.routes.draw do

  root :to => 'courses#index'

  resources :courses do
    resources :lessons
    resources :exams
  end

end