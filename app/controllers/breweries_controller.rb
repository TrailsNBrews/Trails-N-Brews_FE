class BreweriesController < ApplicationController
  def index
    if params[:name]
      @breweries = BreweryFacade.search_breweries("/api/v1/search_breweries?name=#{params[:name]}")
      if @breweries == []
          flash.alert = "Search returned no results"
      end
    end
  end

  def show
    @brewery  = BreweryFacade.show_brewery("api/v1/search_breweries/#{params[:id]}")
    if current_user
      if JSON.parse(BackendService.accomplishments(current_user).body, symbolize_names: true)[:data][:user][:breweries].include?(@brewery)
        @favorite = true
      else
        @favorite = false
      end
    end
  end
end
