Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants do
    resources :reservations
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
