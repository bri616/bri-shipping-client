class CreateShippingOptions < ActiveRecord::Migration
  def change
    create_table :shipping_options do |t|
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
