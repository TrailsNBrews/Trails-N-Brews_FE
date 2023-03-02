class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    unless @current_user
      user = JSON.parse(BackendService.user_create_or_find(AUTH_VAL: session[:user_email], ID: session[:user_id]).body, symbolize_names: true) if session[:user_id]
      
      unless user.include?('error')
        @current_user = User.new(user[:data])
      end
    end
    @current_user
  end
end
