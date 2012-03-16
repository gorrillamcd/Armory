Armory::Application.routes.draw do

  root :to => 'courses#index'

  resources :courses do
    member do
      get 'detail'
    end
    resources :lessons
    resources :exams
  end

end