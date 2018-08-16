Rails.application.routes.draw do
  devise_for :users
  root to: 'caves#index'

  # resources :users

  resources :caves do
    resources :bookings, only: [ :new, :create]
  end

  resources :bookings, except: [ :new, :create]
  resources :users, only: [:show]
end
