Rails.application.routes.draw do
  get 'users/index'
  root to: 'orders#index'
  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements
end
