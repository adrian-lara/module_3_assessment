class Store

  attr_reader :long_name, :city, :distance, :phone, :store_type

  def initialize(store_info)
    @long_name = store_info[:longName]
    @city = store_info[:city]
    @distance = store_info[:distance]
    @phone = store_info[:phone]
    @store_type = store_info[:storeType]
  end

end
