Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants
  resources :users do
    resources :reservations
  end
  resources :sessions, only: [:new, :create, :destroy]
end
