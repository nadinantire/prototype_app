Rails.application.routes.draw do
  root to: 'orders#index'
  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements
end
