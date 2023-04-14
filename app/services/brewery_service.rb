class BreweryService
  def self.connection
    Faraday.new(url: 'https://trailsnbrews-be.herokuapp.com' )
  end

  def self.parse_response(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end
end