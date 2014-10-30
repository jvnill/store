class OrdersController < ApplicationController
  before_action :authorize

  def add
    product = Product.find(params[:product_id])

    order_item = current_order.order_items.where(product_id: product.id).first_or_initialize
    order_item.quantity += 1
    order_item.save
  end

  def checkout
    lock_price_to_order_items

    current_order.update_column :status, 'pending'

    redirect_to "#{GATEWAY_PAYMENT_URL}?app_id=#{BANK_CONNECTED_APP_ID}&items=#{encrypted_data}"
  end

  private

  def lock_price_to_order_items
    current_order.order_items.includes(:product).each do |order_item|
      order_item.update_column :price, order_item.product.price
    end
  end

  def current_order_items
    current_order.order_items.includes(:product).each_with_object({}) do |order_item, hash|
      hash[order_item.product.name] = { quantity: order_item.quantity, price: order_item.price }
    end
  end

  def encrypted_data
    public_key = OpenSSL::PKey::RSA.new(BANK_PUBLIC_KEY)
    encrypted  = public_key.public_encrypt(current_order_items.merge(order_id: current_order.id).to_param)

    CGI.escape Base64.encode64(encrypted)
  end
end
