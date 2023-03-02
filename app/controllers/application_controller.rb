class ApplicationController < ActionController::Base
  rescue_from StandardError::RecordError, with: :error_response_record
  
  def error_response_record(error)
    render json: ErrorSerializer.error_json(error), status: 404
  end
end
