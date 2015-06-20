RailsBookkeeper::Application.routes.draw do
  root to: 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  get '/chartofaccounts', to: 'accounts#index'

  resources :users, except: [:index, :show, :new, :destroy]
    
  resources :journals, except: [:show, :edit, :update, :destroy]
  resources :accounts, except: :destroy
  
end
