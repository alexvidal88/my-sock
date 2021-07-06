Rails.application.routes.draw do
  get 'dashboard', to: 'pages#dashboard'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :socks, except: [:edit, :update] do
    resources :bookings
  end
  resources :bookings, only: :destroy
end
