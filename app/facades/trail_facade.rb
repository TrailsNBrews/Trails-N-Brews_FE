class TrailFacade
  def self.search_trails(uri)
    # binding.pry
    @trails = filter_trails(uri)[:data].map do |trail|
      Trail.new(trail)
    end
  end

  def self.show_trail(uri)
    trail = Trail.new(filter_trails(uri)[:data][:trail])
    breweries_data = filter_trails(uri)[:data][:breweries]
    breweries = breweries_data.map do |brewery| 
      Brewery.new(brewery)
    end
    trail_breweries = {trail => breweries}
    # binding.pry
  end

  def self.filter_trails(uri)
    BackendService.parse_response(uri)
  end
end