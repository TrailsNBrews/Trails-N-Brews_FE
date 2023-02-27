class TrailFacade
  def self.search_trails(uri)
    @trails = filter_trails(uri)[:data].map do |trail|
      Trail.new(trail)
    end
  end

  def self.filter_trails(uri)
    BackendService.parse_response(uri)
  end
end