class StoreSearchResult

  attr_reader :store_count, :stores

  def initialize(parsed_results)
    @store_count = parsed_results[:total]
    @stores = create_stores(parsed_results[:stores])
  end

  private

    def create_stores(raw_stores)
      raw_stores.map { |raw_store| Store.new(raw_store) }
    end
end
