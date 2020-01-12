Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  delete '/users/:id', to: 'users#destroy', as: 'user' 

  resources :users

  resources :climbers, only: [:index, :new, :create, :show, :edit, :update] do 
    resources :mountains, only: [:index, :new, :create]
  end 

  resources :mountains, only: [:index, :new, :create, :show, :edit, :update] 
  resources :climbs, only: [:index, :new, :create, :show, :edit, :update]
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
