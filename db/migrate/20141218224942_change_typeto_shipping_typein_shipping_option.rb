class ChangeTypetoShippingTypeinShippingOption < ActiveRecord::Migration
  def change
    rename_column :shipping_options, :type, :shipping_type
  end
end
