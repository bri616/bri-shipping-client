class ShippingQuery
  def initialize(weights,city,state, postal_code)
    @shipping_api = "http://ship-my-ducks.herokuapp.com/"
    # make an array of weights.length, each element is [20,20,20]
    @dimensions = weights.length.times.collect{["20","20","20"]}
    @query = query(weights, city, state, postal_code)
  end

  def query(weights, city, state, postal_code)
    @query =
    {:package_specs => {
      :weights => weights,
      :dimensions => @dimensions
    },

    :origin_specs => {
      :country => 'US',
      :state => 'CA',
      :city => 'Beverly Hills',
      :zip => '90210'
    },

    :destination_specs => {
      :country => 'US',
      :state => state,
      :city => city,
      :zip => postal_code
    }}
  end

  def ups_quote
    HTTParty.get(@shipping_api+"ups/rates/", :query => @query).parsed_response
  end

  def usps_quote
    HTTParty.get(@shipping_api+"usps/rates/", :query => @query).parsed_response
  end
end
