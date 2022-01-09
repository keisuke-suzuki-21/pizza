Rails.application.routes.draw do
  root "top#index"

  resources :members do
    resources :orders, only: [:index]
  end

  resources :mainmenus do
    resources :toppings, only: [:index]
    resources :products, only: [:new, :show, :edit]
  end

  resources :sidemenus
  resources :toppings
  resources :orders# , expect: [:index]
  resource :session, only: [:edit, :create, :destroy]
  resources :products

  get "cart/:mainmenu" => "mainmenus#cart", as: "cart"

  namespace :admin do
    root "top#index"
    resources :sessions
    resources :administrators
    resources :members
    resources :mainmenus
    resources :sidemenus
    resources :toppings
    resources :orders
  end
end
