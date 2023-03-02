class SessionsController < ApplicationController
  def create
    BackendService.user_create_or_find(user_params)
    session[:user_id] = user_params[:google_id]

    redirect_to user_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
    # {
    #   'uid' => '1346464641',
    #   'info' => { 
    #     'email' =>      'jim@email.com',
    #     'first_name' => 'Jimmy',
    #     'last_name' =>  'Jimmington'
    #   },
    #   'credentials' => { 'token' => 'dj6s5f4sl5fj' }
    # }
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
