Rails.application.routes.draw do
  root to: "events#index"

  get "invitations", to: "invitations#new_invite_list"
  post "invitations", to: "invitations#create"

  post "attendances/join", to: "attendances#join"
  delete "attendances/leave", to: "attendances#leave"
  get "my_events", to: "users#show"

  devise_for :users

  get "events", to: "events#index"
  get "events/new", to: "events#new"
  post "events", to: "events#create"
  get "events/:id", to: "events#show", as: "event"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
