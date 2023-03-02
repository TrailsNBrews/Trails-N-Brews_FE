class AccomplishmentsController < ApplicationController
  def index; end

  def create
    BackendService.accomplishments_trail(params[:user], params[:trail]) if params[:trail]
    BackendService.accomplishments_brewery(params[:user], params[:brewery]) if params[:brewery]
  end
end
