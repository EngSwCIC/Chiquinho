Rails.application.routes.draw do
  resources :subjects
  resources :courses
  devise_for :users, :controllers => { registrations: 'registrations/registrations' }
  root to: 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
