class BackendService
  def self.connection
    Faraday.new(url: 'https://trailsnbrews-be.herokuapp.com' )
    # Faraday.new(url: 'http://localhost:5000' )
  end

  def self.parse_response(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end

  def self.response(uri)
    connection.get(uri)
  end

  def self.user_create_or_find(params)
    if params.length > 3
      connection.post('/api/v1/users') do |req|
        req.body = {user: params}
      end
    else
      connection.get("/api/v1/users/#{params[:ID]}") do |req|
        req.headers = params
      end
    end
  end

  def self.accomplishments_trail(user_id, trail_id, trail_name)
    connection.post('/api/v1/user_trails') do |req|
      req.params[:user_id] = user_id,
      req.params[:trail_id] = trail_id,
      req.params[:trail_name] = trail_name
    end
  end

  def self.accomplishments_brewery(user_id, brewery_id, brewery_name)
    connection.post('/api/v1/user_breweries') do |req|
      req.params[:user_id] = user_id,
      req.params[:brew_id] = brewery_id,
      req.params[:brew_name] = brewery_name
    end
  end

  def self.accomplishments(user)
    connection.get("/api/v1/user_accomplishments/#{user.id}")
  end
end
