Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'secrets/new'

root 'application#hello'
get '/login' => 'users#new'
get '/login' => 'users#create'
get '/logout' => 'users#destroy'

post '/login' => 'users#create'

get '/secret' => 'secrets#show'
resources :users


end
