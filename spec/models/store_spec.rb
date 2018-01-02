require 'rails_helper'

describe Store do
  describe "Instance Methods" do

    before(:each) do
      @store = Store.new({
        longName: "Cherry Creek Shopping Center",
        city: "Denver",
        distance: 3.45,
        phone: "303-270-9189",
        storeType: "Mobile SAS"
        })
    end

    describe "#long_name" do
      it "returns the long name of the store" do
        expect(@store.long_name).to eq("Cherry Creek Shopping Center")
      end
    end

    describe "#city" do
      it "returns the city of the store" do
        expect(@store.city).to eq("Denver")
      end
    end

    describe "#distance" do
      it "returns the distance of the store" do
        expect(@store.distance).to eq(3.45)
      end
    end

    describe "#phone" do
      it "returns the phone number of the store" do
        expect(@store.phone).to eq("303-270-9189")
      end
    end

    describe "#store_type" do
      it "returns the type of the store" do
        expect(@store.store_type).to eq("Mobile SAS")
      end
    end

  end
end
