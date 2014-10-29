class OrdersController < ApplicationController
  before_action :authorize

  def add
    product = Product.find(params[:product_id])

    order_item = current_order.order_items.where(product_id: product.id).first_or_initialize
    order_item.quantity += 1
    order_item.save
  end
end
