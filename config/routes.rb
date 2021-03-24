Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create]
  get '/profile', to: "users#show"

  get '/login', to: "users#login_form"
  post '/login', to: "users#login"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
