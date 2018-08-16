Rails.application.routes.draw do
  devise_for :users
  root to: 'caves#index'

  # resources :users

  resources :caves do
    resources :bookings, only: [ :new, :create]
  end

<<<<<<< HEAD
  resources :bookings, except: [ :new, :create]
  resources :users, only: [:show]
=======
  resources :conversations, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end

>>>>>>> master
end
