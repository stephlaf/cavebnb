Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :caves do
    
  end
  resources :users
  resources :bookings

end
