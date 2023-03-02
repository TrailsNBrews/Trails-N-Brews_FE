class UserFacade

  def self.create_or_find(params)
    response = JSON.parse(BackendService.user_create_or_find(params).body, symbolize_names: true)

  end
end