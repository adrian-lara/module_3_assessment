class Store

  def initialize(store_info)
    @long_name = store_info[:longName]
    @city = store_info[:city]
    @distance = store_info[:distance]
    @phone = store_info[:phone]
    @store_type = store_info[:storeType]
  end

end
