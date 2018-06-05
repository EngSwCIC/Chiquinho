Rails.application.routes.draw do
  resources :subjects do
    resources :professors, :controller => :professor_subjects
  end
  resources :subjects
  
  resources :courses do
    resource :forums, only: [:show] do
      resource :topics
    end
  end
  resources :department, only: [:index, :show]
  resources :professors
  resources :courses
  resources :subjects do
    resources :study_materials, only: [:create, :new]
  end
  resources :comments, only: [:create]
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  root to: 'main#index'
  post '/update_user_schedule',to: "main#update_user_schedule",as: "update_user_schedule"
  post '/update_user_professor_subject_rating',to: "professor_subjects#update_user_professor_subject_rating",as: "update_user_professor_subject_rating"
  get '/clean_user_schedule',to: "main#clean_user_schedule",as: "clean_user_schedule"
  get '/grade', to: "main#schedule", as: "user_schedule"
  get '/search_subject', to: 'main#search_subject', as: :search_subject
end
