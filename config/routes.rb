Rails.application.routes.draw do
  get "landing/index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "landing#index"

  # OIDC callbacks
  get "auth/hack_club/callback", to: "sessions#hackclub_callback", as: :hackclub_callback

  # Dashboard
  get "dashboard", to: "dashboard#index", as: :dashboard
  resources :teams do
    get :join, on: :collection
    post :join, on: :collection
  end
  delete "logout", to: "sessions#destroy", as: :logout
  post "teams/notes", to: "teams#add_note", as: :teams_notes
end
