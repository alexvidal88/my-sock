Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  devise_for :users
  root to: 'pages#home'

  resources :socks, except: [:edit, :update] do
    resources :bookings
  end
  resources :bookings, only: :destroy
end
