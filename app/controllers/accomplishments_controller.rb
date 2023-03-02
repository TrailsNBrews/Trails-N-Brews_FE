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
      BackendService.accomplishments_trail(current_user, params[:trail]) if params[:trail]
      BackendService.accomplishments_brewery(current_user, params[:brewery]) if params[:brewery]
    end
  end
end
