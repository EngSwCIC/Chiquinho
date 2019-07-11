Rails.application.routes.draw do
  
  get 'topics/new'
  get 'topics/create'
  get 'forums/show'
  resources :subjects do
    resources :professors, :controller => :professor_subjects
  end
  resources :subjects
  
  resources :courses do
    resources :forums, only: [:show] do
      resources :topics do
        resources :comments do
          resources :responses
        end
      end
    end
  end

  resources :forums, only: [:index]

  
  resources :department, only: [:index, :show]
  resources :professors
  resources :courses

  get 'course/:id/professors', to: "courses#course_professors", as: "course_professors"
  resources :subjects do
    resources :study_materials, only: [:create, :new]
  end
  resources :comments, only: [:create]
  resources :responses, only: [:create]
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  root to: 'main#index'
  post '/update_user_schedule',to: "main#update_user_schedule",as: "update_user_schedule"
  post '/update_user_professor_subject_rating',to: "professor_subjects#update_user_professor_subject_rating",as: "update_user_professor_subject_rating"
  get '/clean_user_schedule',to: "main#clean_user_schedule",as: "clean_user_schedule"
  get '/grade', to: "main#schedule", as: "user_schedule"
  get '/search_subject', to: 'main#search_subject', as: :search_subject
  post '/likes/:user_id', to: 'comments#like_comment', as: :like
end