Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/home', to: 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get 'users', to: 'users#index', as: 'users'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  namespace :artworks do
    resources :ownerships, only: [:index]
  end

  resources :events
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]

end
