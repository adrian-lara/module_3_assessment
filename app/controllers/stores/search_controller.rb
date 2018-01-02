class Stores::SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:q]},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV["BESTBUY_KEY"]}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end
