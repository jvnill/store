class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity, default: 0
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
