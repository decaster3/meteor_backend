class ApplicationController < ActionController::API
  before_action :authenticate_user!
  include Response
  include ExceptionHandler

  respond_to :json

  protected

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
