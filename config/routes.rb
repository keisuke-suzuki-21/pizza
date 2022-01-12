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
    # collection do
    #   post :confirm
    # end
  end

  resources :sidemenus
  resources :toppings
  resource :session, only: [:edit, :create, :destroy]
  resources :products

  get "cart/:product" => "products#cart", as: "cart"
  post "order/confirm/:order" => "orders#confirm", as: "confirm"

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
