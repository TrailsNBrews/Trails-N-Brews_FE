class TrailsController < ApplicationController

  def index
    if params[:name]
      @trails = TrailFacade.search_trails("/api/v1/search_trails?search=#{params[:name]}")  
    end
  end

  def show
    trail_breweries = TrailFacade.show_trail("/api/v1/search_trails/#{params[:id]}").first
    @trail = trail_breweries[0]
    @breweries = trail_breweries[1]
  end
end