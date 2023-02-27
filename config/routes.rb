Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new', as: :new_user
  get '/auth/:provider/callback', to: 'sessions#create'
  resource :user, only: [:show] do 
    get :accomplishments, on: :collection, as: :accomplishments
    # resources :accomplishments, only: :index, controller: 'users'
  end

  resources :trails, only: [:index, :show]
  resources :breweries, only: [:index, :show]

end
