require 'rails_helper'

describe StoreSearchResult do
  describe "Instance Methods" do

    before(:each) do
      @result = StoreSearchResult.new(1, [Store.new({})])
    end

    describe "#store_count" do
      it "returns the number of stores" do
        expect(@result.store_count).to eq(1)
      end
    end

    describe "#stores" do
      it "returns a collection of stores" do
        expect(@result.stores).to be_a Array
        expect(@result.stores.first).to be_a Store
      end
    end
  end
end
