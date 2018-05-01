Rails.application.routes.draw do
  resources :subjects
  resources :courses
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  root to: 'main#index'
  post '/update_user_schedule',to: "main#update_user_schedule",as: "update_user_schedule"
  get '/clean_user_schedule',to: "main#clean_user_schedule",as: "clean_user_schedule"
  get '/grade',to: "main#schedule",as: "user_schedule"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
