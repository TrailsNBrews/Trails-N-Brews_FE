class AccomplishmentsController < ApplicationController
  def index
    stats = BackendService.accomplishments(current_user)
    @trails    = stats[:user][:trails]
    @breweries = stats[:user][:breweries]
  end

  def create
    BackendService.accomplishments_trail(current_user, params[:trail]) if params[:trail]
    BackendService.accomplishments_brewery(current_user, params[:brewery]) if params[:brewery]
  end
end
