module CartHelper
  def show_shipping_options(address, items)
    weights = items.collect{|item| item.product.weight.to_i}
    city = address.city
    state = address.state
    postal_code = address.postal_code
    quotes = ShippingQuery.new(weights, city, state, postal_code)
    quotes.ups_quote.inspect + quotes.usps_quote.inspect
  end
end
