class AccomplishmentsController < ApplicationController
  def index
    stats = BackendService.accomplishments(current_user)
    @trails    = JSON.parse(stats.body, symbolize_names: true)[:data][:user][:trails]
    @breweries = JSON.parse(stats.body, symbolize_names: true)[:data][:user][:breweries]
  end

  def create
    BackendService.accomplishments_trail(current_user, params[:trail]) if params[:trail]
    BackendService.accomplishments_brewery(current_user, params[:brewery]) if params[:brewery]
  end
end
