class Stores::SearchController < ApplicationController

  def index
    service = StoreService.new
    @results = service.search_stores_by_zip(params[:q])
  end

end
