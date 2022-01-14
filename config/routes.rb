Rails.application.routes.draw do
  root "top#index"

  resources :members do
    resources :orders, only: [:index]
  end

  resources :mainmenus do
    resources :toppings, only: [:index]
    resources :products, only: [:new, :show, :edit]
  end

  resources :orders do
    resources :products, only: [:index, :edit, :show]
    resources :sidemenus, only: [:edit]
  end

  resources :sidemenus
  resources :toppings
  resource :session, only: [:edit, :create, :destroy]
  resources :products

  get "cart/:product" => "products#cart", as: "cart"
  post "order/:id/confirm" => "orders#confirm", as: "confirm"
  post "order/:id/complete" => "orders#complete", as: "complete"

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
