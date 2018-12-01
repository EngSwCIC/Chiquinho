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
  get '/professors/:id/favorite', to: 'professors#favorite', as: :favorite_professor
  get '/professors/:id/unfavorite', to: 'professors#unfavorite', as: :unfavorite_professor


  resources :courses
  get 'course/:id/professors', to: "courses#course_professors", as: "course_professors"
  resources :subjects do
    resources :study_materials, only: [:create, :new]
  end

  get 'subject_classes/:id', to: "subject_classes#show", as: "subject_class"
  get 'subject_classes/:id/add_class_schedule', to: "subject_classes#add_class_schedule", as: "add_class_schedule"

  resources :comments, only: [:create]
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  root to: 'main#index'
  post '/update_user_schedule',to: "main#update_user_schedule",as: "update_user_schedule"
  post '/update_user_professor_subject_rating',to: "professor_subjects#update_user_professor_subject_rating",as: "update_user_professor_subject_rating"
  get '/clean_user_schedule',to: "main#clean_user_schedule",as: "clean_user_schedule"
  get '/grade', to: "main#schedule", as: "user_schedule"
  get '/search_subject', to: 'main#search_subject', as: :search_subject
  post '/likes/:user_id', to: 'comments#like_comment', as: :like
end
