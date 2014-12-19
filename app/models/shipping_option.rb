class ShippingOption < ActiveRecord::Base
  monetize :price_cents
end
