Rails.application.routes.draw do
  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements
end
