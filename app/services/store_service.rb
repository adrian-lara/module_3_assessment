class StoreService

  def self.search_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV["BESTBUY_KEY"]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    create_store_search_result(parsed_response)
  end

  private

    def self.create_store_search_result(parsed_response)
      stores_count = parsed_response[:total]
      stores = parsed_response[:stores].map { |raw_store| Store.new(raw_store) }

      StoreSearchResult.new(stores_count, stores)
    end

end
