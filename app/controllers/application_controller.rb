class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= BackendService.user_create_or_find(session[:user_id]) if session[:user_id]
  end
end
