Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  # get 'sessions', to: 'sessions#create'
  
  resource :user, only: [:show, :create] do 
    resources :accomplishments, only: [:index, :create], controller: 'accomplishments'
  end

  resources :trails, only: [:index, :show]
  resources :breweries, only: [:index, :show]
end
