Rails.application.routes.draw do
  root "sessions#home"

  get '/' => 'sessions#show'
  post '/' => 'sessions#create'
  
  match '/auth/:provider/callback' => 'sessions#google',  via: [:get, :post]

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  resources :sessions
  resources :services
  resources :users
  resources :posts 
  resources :userfavorites
  resources :users do 
    resources :posts
    resources :userfavorites
  end 
  
  get '/search', to: 'users#search', as: 'search'
  
end
