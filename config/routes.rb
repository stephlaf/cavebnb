Rails.application.routes.draw do
  devise_for :users
  root to: 'caves#index'

  # resources :users

  resources :caves do
    resources :bookings, only: [ :new, :create]
    resources :reviews, only: [:create]
  end
  resources :bookings, except: [ :new, :create]

  resources :conversations, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
end
