Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#home'
  post '/' => 'sessions#create'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  
  resources :sessions
  resources :services
  resources :users
  resources :posts 
  resources :userfavorites, only: [:create, :destroy]
  resources :users do 
    resources :posts
    end 

end
