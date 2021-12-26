Rails.application.routes.draw do
  root "top#index"
  resources :members
  resources :sidemenus
  resources :mainmenus
end
