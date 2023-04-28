Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :line_items
  resources :carts
  resources :products
  resources :orders
  resources :order_histories

  root to: 'products#index'

end
