class BreweriesController < ApplicationController

    def index
        if params[:name]
            @breweries = BreweryFacade.search_breweries("/breweries?by_name=#{params[:name]}&per_page=3")
        end
    end

    def show
        @brewery = BreweryFacade.show_brewery("/breweries/#{params[:id]}")
    end
    
    
end