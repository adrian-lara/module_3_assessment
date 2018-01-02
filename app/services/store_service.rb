class StoreService

  def self.search_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV["BESTBUY_KEY"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    StoreSearchResult.new(parsed_response)
  end

end
