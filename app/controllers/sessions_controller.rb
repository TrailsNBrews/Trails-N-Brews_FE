class SessionsController < ApplicationController
  def create
    user = BackendService.user_create_or_find(user_params)
    session[:user_id] = user_params[:google_id]
    redirect_to user_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    {
      google_id: auth_hash['uid'],
      email: auth_hash['info']['email'],
      token: auth_hash['credentials']['token'],
      first_name: auth_hash['info']['first_name'],
      last_name: auth_hash['info']['last_name']
    }
  end
end