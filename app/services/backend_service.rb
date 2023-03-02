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
    # require 'pry';binding.pry
    if params.length > 3
      connection.post('/api/v1/users') do |req|
        req.body = {user: params}
      end
    else
      connection.get('/api/v1/users/1') do |req|
        req.headers = params
      end
    end
  end

  def self.accomplishments_trail(user, trail)
    connection.post('/api/v1/user_accomplishments') do |req|
      req.params[:user] = user,
      req.params[:trail] = trail
    end
  end

  def self.accomplishments_brewery(user, brewery)
    connection.post('/api/v1/user_accomplishments') do |req|
      req.params[:user] = user,
      req.params[:trail] = brewery
    end
  end

  def self.accomplishments(user)
    connection.get("/api/v1/user_accomplishments/#{user}")
  end
end
