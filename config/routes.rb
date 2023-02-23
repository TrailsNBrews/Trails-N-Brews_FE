Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new', as: :new_user

  resource :user, only: [:show]
  resources :trails, only: [:index]
  resources :breweries, only: [:index]

end
