module CartHelper

  def shipping_options(address, items)
    weights = items.collect{|item| item.product.weight.to_i}
    city = address.city
    state = address.state
    postal_code = address.postal_code
    quotes = ShippingQuery.new(weights, city, state, postal_code)
    allquotes = quotes.ups_quote.merge(quotes.usps_quote)
    # make an array of ShippingOption objects

    allquotes.collect! do |option_type, option_price|
      ShippingOption.new(shipping_type: option_type, price: option_price.to_i)
    end

    
  end

  def shipping_option_label(shipping_option)
    "#{shipping_option.shipping_type} #{shipping_option.price}"
  end
end
