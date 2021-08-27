Rails.application.routes.draw do
  root to: 'congress#search'
  post '/search', to: 'congress#search'
  get '/search', to: 'congress#search'
end
