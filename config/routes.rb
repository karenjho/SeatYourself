Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants do
    resources :reviews
    resources :reservations
  end

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :tags, only: [:new, :create, :show, :destroy]
end
