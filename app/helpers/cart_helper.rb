module CartHelper

  def shipping_options(address, items)
    weights = items.collect{|item| item.product.weight.to_i}
    city = address.city
    state = address.state
    postal_code = address.postal_code
    quotes = ShippingQuery.new(weights, city, state, postal_code)
    upsquotes = quotes.ups_quote
    uspsquotes = quotes.usps_quote
    # make an array of ShippingOption objects

    upsquotes = upsquotes.collect do |option_type, option_price|
      ShippingOption.new(shipping_type: option_type, price: option_price.to_i)
    end

    uspsquotes = uspsquotes.collect do |option_type, option_price|
      ShippingOption.new(shipping_type: option_type, price: option_price.to_i)
    end

    upsquotes.sort_by(&:price).first(3) + uspsquotes.sort_by(&:price).first(3)

  end

  def shipping_option_label(shipping_option)
    "#{shipping_option.shipping_type} #{shipping_option.price}"
  end
end
