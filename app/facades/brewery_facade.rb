class BreweryFacade

  def self.search_breweries(uri)
    @breweries = filter_breweries(uri).map do |brewery|
      Brewery.new(brewery)
    end
  end

  def self.filter_breweries(uri)
    BreweryService.parse_response(uri)
  end
end