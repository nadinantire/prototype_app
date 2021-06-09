Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'

  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
