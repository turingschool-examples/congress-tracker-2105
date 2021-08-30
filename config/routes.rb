Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  # get '/logout', to: 'sessions#logout_user' # using get AND destroy here since I want 'Log out' to be a link, and link defaults to a get. But, I also don't want the DELETE '/login' path to be used for anything else.
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

  post '/search', to: 'congress#search'
  post '/search_state', to: 'congress#search_state'
end
