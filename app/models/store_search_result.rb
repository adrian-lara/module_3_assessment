class StoreSearchResult

  attr_reader :store_count, :stores

  def initialize(store_count, stores)
    @store_count = store_count
    @stores = stores
  end

end
