class UserFacade

  def self.create_or_find_by(email)
    @user = User.find_or_create_by(email)
  end

end