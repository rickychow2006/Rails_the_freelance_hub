Rails.application.routes.draw do
  root "sessions#home"

  get '/' => 'sessions#show'

  post '/' => 'sessions#create'
  
  match '/auth/:provider/callback' => 'sessions#google',  via: [:get, :post]

  get '/signup' => 'users#new'

  post '/signup' => 'users#create'

  get '/search', to: 'users#search', as: 'search'
  
  resources :sessions, only: [:create, :show, :destroy]
  resources :services
  resources :users
  resources :posts 
  resources :userfavorites, only: [:index, :create, :destroy ]
  
  resources :users do 
    resources :posts
    resources :userfavorites
  end 
  
end
