class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # require 'pry';binding.pry
    unless @current_user
      user = JSON.parse(BackendService.user_create_or_find(HTTP_AUTH_VAL: session[:user_email]).body, symbolize_names: true) if session[:user_id]
      
      unless user.include?('error')
        @current_user = User.new(user)
      end
    end
  end
end
