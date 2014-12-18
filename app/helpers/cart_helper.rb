module CartHelper
  def show_shipping_options(address, items)
    weights = items.collect{|item| item.product.weight.to_i}
    city = address.city
    state = address.state
    quotes = ShippingQuery.new(weights, city, state)
    
  end
end
