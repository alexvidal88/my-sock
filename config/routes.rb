Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :socks, except: [:edit, :update] do
    resources :bookings, only: [:update, :create]
  end
  resources :bookings, only: :destroy

end
