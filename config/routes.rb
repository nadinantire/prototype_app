Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :destroy]
  end

  resources :orders
  resources :accessories
  resources :items
  resources :order_overviews
  resources :attachements

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
