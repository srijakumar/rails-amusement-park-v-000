Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"



  #get "/signin", to: "sessions#new"
  #post "/sessions/create", to: "sessions#create"
  #delete "/signout", to: "sessions#destroy"

  #resources :users
  #resources :attractions

  #post "/rides/new", to: "rides#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides

end
