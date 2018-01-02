require 'rails_helper'

describe "Store Service" do
  describe "Class Methods" do
    describe ".search_stores_by_zip(zip)" do
      describe "when zip = 80202" do
        it "returns a StoreSearchResult instance having a store_count integer and a stores array" do
          VCR.use_cassette("stores_search_80202") do
            result = StoreService.search_stores_by_zip("80202")

            expect(result).to be_a StoreSearchResult
            expect(result.store_count).to be_a Integer
            expect(result.stores).to be_a Array
          end
        end
      end
    end
  end
end
