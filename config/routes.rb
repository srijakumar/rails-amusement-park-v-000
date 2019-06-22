Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'secrets/new'

root 'application#hello'
get '/signup' => 'users#new'
get '/signup' => 'users#create'
get '/logout' => 'users#destroy'

post '/signup' => 'users#create'
post '/users' => 'secrets#show'

get '/secret' => 'secrets#show'
resources :users


end
