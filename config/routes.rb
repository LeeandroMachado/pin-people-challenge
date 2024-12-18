Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post "datasets", to: "datasets#import"

  resources :employees, only: [ :index ]
end
