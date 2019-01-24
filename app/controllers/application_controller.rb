class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { message: exception.message }, status: 400
  end
end
