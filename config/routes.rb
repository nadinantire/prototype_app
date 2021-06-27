Rails.application.routes.draw do
  root "tops#index"
  get "tops/index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :users
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :destroy]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener"


  resources :purchases do
    resources :order_confirmations
    collection do
      get 'search'
    end
  end
end
