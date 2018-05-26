# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :cors_set_access_control_headers
  include Response
  include ExceptionHandler

  respond_to :json

  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Expose-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  protected

  def admin_only
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def authenticate
    if authenticate_user!
      if current_user.confirmed?
        render json: {error: 'Not allowed to request SMS.'}, status: 400
      end
    end
  end

end
