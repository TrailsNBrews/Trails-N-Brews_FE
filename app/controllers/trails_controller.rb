class TrailsController < ApplicationController
  def index
    if params[:name]
      @trails = TrailFacade.search_trails("/api/v1/search_trails?search=#{params[:name]}")
        if @trails == []
            flash.alert = "Search returned no results"
        end
    end
  end

  def show
    trail_breweries = TrailFacade.show_trail("/api/v1/search_trails/#{params[:id]}").first
    @trail = trail_breweries[0]
    @breweries = trail_breweries[1]
    if current_user
      if JSON.parse(BackendService.accomplishments(current_user).body, symbolize_names: true)[:data][:user][:trails].include?(@trail)
        @favorite = true
      else
        @favorite = false
      end
    end
  end
end
