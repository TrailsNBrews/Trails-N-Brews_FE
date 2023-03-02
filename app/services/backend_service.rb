class BackendService
  def self.connection
    Faraday.new(url: 'https://evening-caverns-30828.herokuapp.com' )
  end

  def self.parse_response(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end

  def self.user_create_or_find(params)
    connection.post('/users') do |req|
      req.body = params
    end
  end

  def self.accomplishments_trail(user, trail)
    connection.post('/users') do |req|
      req.params[:user] = user,
      req.params[:trail] = trail
    end
  end

  def self.accomplishments_brewery(user, brewery)
    connection.post('/users') do |req|
      req.params[:user] = user,
      req.params[:trail] = brewery
    end
  end

  def self.accomplishments(user)
    connection.get("/accomplishments/#{user}")
  end
end
