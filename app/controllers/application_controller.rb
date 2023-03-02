class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    unless @current_user
      user = JSON.parse(BackendService.user_create_or_find(HTTP_AUTH_VAL: session[:user_email], HTTP_AUTH_TOKEN: session[:user_token]).body, symbolize_names: true) if session[:user_id]
      if user
        @current_user = User.new(user.deep_symbolize_keys)
      end
    end
  end
end
