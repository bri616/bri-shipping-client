class AddOrderIdtoShippingOption < ActiveRecord::Migration
  def change
    add_column :shipping_options, :order_id, :integer
  end
end
