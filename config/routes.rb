Rails.application.routes.draw do
  get 'welcome/home'
  get '/signin', to: 'sessions#new', as: 'signin'
   post '/session/', to: 'sessions#create', as: 'session'
  root 'welcome#home'
   resources :users, only: [:new, :create, :show]
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users', to:'users#index', as: 'users'
  # post '/users', to:'users#create'
  # get '/signin', to: 'users#new'
  # post '/signin', to: 'users#create'
  get '/logout', to: 'sessions#destroy'
  get 'users/mood'
  get 'rides/take_ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  get '/attractions/', to: 'attractions#index'
#  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
#  get '/attractions/new', to: 'attractions#new'
#   post '/attractions/', to: 'attractions#create'
 resources :attractions
 get '/rides/:id', to: 'rides#show', as: 'ride'
 get '/rides/new', to: 'rides#new'
 post '/rides/', to: 'rides#create'
 get '/sessions/new', to: 'sessions#new'
 get '/sessions/create', to: 'sessions#create'
end
