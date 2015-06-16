RailsBookkeeper::Application.routes.draw do
  root to: 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  get '/chartofaccounts', to: 'users#show'

  resources :users, except: [:index, :show, :new, :destroy] do
    
    resources :journals, only: [:index, :show, :new, :create]
    resources :accounts, only: [:show, :new, :create, :edit, :update]
  end
end
