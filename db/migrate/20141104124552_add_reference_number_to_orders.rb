class AddReferenceNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :reference_number, :string
  end
end
