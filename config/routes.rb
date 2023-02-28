Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  resource :user, only: [:show] do 
    get :accomplishments, on: :collection, as: :accomplishments
    # resources :accomplishments, only: :index, controller: 'users'
  end

  resources :trails, only: [:index, :show]
  resources :breweries, only: [:index, :show]

end
