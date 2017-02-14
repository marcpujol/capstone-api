class ApplicationController < ActionController::API
  # Make the connection between controller action and associated view
  include ActionController::ImplicitRender
  include ActionController::RequestForgeryProtection
  rescue_from ActiveRecord::RecordNotFound, :with => :notfound
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def notfound(exception = nil)
    message = exception.nil? ? 'The requested object could not be found' : exception.message
    render json: { error: "Not found: #{message}" }.to_json, status: 404
  end
end
