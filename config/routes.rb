Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements
end
