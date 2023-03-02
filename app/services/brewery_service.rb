class BreweryService
  def self.connection
    Faraday.new(url: 'https://evening-caverns-30828.herokuapp.com' )
  end

  def self.parse_response(uri)
    # binding.pry
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end
end