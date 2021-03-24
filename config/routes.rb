Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create]
  get '/profile', to: "users#show"

  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
end
