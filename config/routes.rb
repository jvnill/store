Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :order_items
end
