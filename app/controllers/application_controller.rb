class ApplicationController < ActionController::API
  # Make the connection between controller action and associated view
  include ActionController::ImplicitRender
  rescue_from ActiveRecord::RecordNotFound, :with => :notfound

  def notfound(exception = nil)
    message = exception.nil? ? 'The requested object could not be found' : exception.message
    render json: { error: "Not found: #{message}" }.to_json, status: 404
  end
end
