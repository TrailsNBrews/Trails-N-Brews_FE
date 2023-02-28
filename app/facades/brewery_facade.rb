class BreweryFacade

  def self.search_breweries(uri)
    @breweries = filter_breweries(uri)[:data].map do |brewery|
      Brewery.new(brewery)
    end
  end

  def self.show_brewery(uri)
    @brewery = Brewery.new(filter_breweries(uri)[:data])
  end

  def self.filter_breweries(uri)
    BreweryService.parse_response(uri)
  end
end