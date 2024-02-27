Rails.application.routes.draw do

  root to: "birds#index"

  devise_for :users

  resources :birds do
    resources :bookings, only: %i[new create]
  end
  resources :users do
    resources :bookings, only: %i[index]
  end
end
