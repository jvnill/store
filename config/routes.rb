Rails.application.routes.draw do
  resources :products
  resources :order_items

  patch '/orders/add' => 'orders#add', as: :add_to_cart
end
