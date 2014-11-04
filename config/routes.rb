Rails.application.routes.draw do
  resources :products

  patch '/orders/add'       => 'orders#add',       as: :add_to_cart
  post  '/orders/checkout'  => 'orders#checkout',  as: :checkout
  post  '/orders/mark_paid' => 'orders#mark_paid'

  root 'products#index'
end
