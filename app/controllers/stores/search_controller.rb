class Stores::SearchController < ApplicationController

  def index
    @results = StoreService.search_stores_by_zip(params[:q])
  end

end
