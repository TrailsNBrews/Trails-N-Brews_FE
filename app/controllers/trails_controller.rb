class TrailsController < ApplicationController

  def index
    if params[:name]
      @trails = TrailFacade.search_trails("/api/v1/search_trails?search=#{params[:name]}")  
    end
  end
end