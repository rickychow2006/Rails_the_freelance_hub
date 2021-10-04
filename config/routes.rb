Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get '/' => 'sessions#home'
post '/' => 'sessions#create'

get '/signup' => 'users#new'
post '/signup' => 'users#create'

resources :sessions
resources :users 
end
