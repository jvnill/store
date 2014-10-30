Rails.application.routes.draw do
  resources :products
  resources :order_items

  patch '/orders/add'      => 'orders#add',      as: :add_to_cart
  post  '/orders/checkout' => 'orders#checkout', as: :checkout

  root 'products#index'
end
