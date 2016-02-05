Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants do
    resources :reviews
    resources :reservations
    resources :tags, only: [:new, :create, :destroy]
  end

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

end
