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
    if params.length > 3
      connection.post('/users') do |req|
        req.body = params
      end
    else
      connection.get('/users') do |req|
        req.headers = params
      end
    end
  end

  def self.accomplishments_trail(user, trail)
    connection.post('/user_accomplishments') do |req|
      req.params[:user] = user,
      req.params[:trail] = trail
    end
  end

  def self.accomplishments_brewery(user, brewery)
    connection.post('/user_accomplishments') do |req|
      req.params[:user] = user,
      req.params[:trail] = brewery
    end
  end

  def self.accomplishments(user)
    connection.get("/user_accomplishments/#{user}")
  end
end
