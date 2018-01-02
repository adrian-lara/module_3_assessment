class Stores::SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:q]},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV["BESTBUY_KEY"]}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    @stores = raw_stores.map { |raw_store| Store.new(raw_store) }
  end

end
