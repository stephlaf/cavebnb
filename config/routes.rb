Rails.application.routes.draw do
  devise_for :users
  root to: 'caves#index'

  # resources :users

  resources :caves do
    resources :bookings, only: [ :new, :create]
    resources :reviews, only: [:create]
  end


  resources :bookings, except: [ :new, :create]
  resources :users, only: [:show]

  resources :conversations, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end

  get "/bookings/:id/accept", to: "bookings#accept", as: "accept_booking"
  get "/bookings/:id/reject", to: "bookings#reject", as: "reject_booking"
end
