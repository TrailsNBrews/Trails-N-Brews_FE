class AccomplishmentsController < ApplicationController
  def index
    if current_user
      stats = BackendService.accomplishments(current_user)
      @trails    = JSON.parse(stats.body, symbolize_names: true)[:data][:user][:trails]
      @breweries = JSON.parse(stats.body, symbolize_names: true)[:data][:user][:breweries]
    end
  end

  def create
    if current_user
      if params[:trail]
        response = BackendService.accomplishments_trail(params[:user_id], params[:trail][:id], params[:trail][:name])
        if response.status == 201
          flash.notice = "Accomplishment Added!"
        else
          flash.alert = "Something went wrong"
        end
      end
      if params[:brewery]
        response = BackendService.accomplishments_brewery(params[:user_id], params[:brewery][:id], params[:brewery][:name])
        if response.status == 201
          flash.notice = "Accomplishment Added!"
        else
          flash.alert = "Something went wrong"
        end
      end
    end
  end
end
