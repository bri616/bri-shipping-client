class ChangePriceToPriceCentsInShippingOption < ActiveRecord::Migration
  def change
    rename_column :shipping_options, :price, :price_cents
  end
end
