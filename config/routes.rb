Rails.application.routes.draw do
  root "top#index"

  resources :members do
    resources :orders, only: [:index]
  end

  resources :mainmenus do
    resources :toppings, only: [:index]
  end

  resources :sidemenus
  resources :toppings
  resources :recipes
  resources :orders
  resource :session, only: [:edit, :create, :destroy]

  namespace :admin do
    root "top#index"
    resources :sessions
    resources :administrators
  end
end
