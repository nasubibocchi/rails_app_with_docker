Rails.application.routes.draw do
  resources :users
  root 'users#index'
  get "up" => "rails/health#show", as: :rails_health_check
  # root 'application#hello'
  # root 'application#goodbye'
end
