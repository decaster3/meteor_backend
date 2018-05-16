# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include Response
  include ExceptionHandler

  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    render json: {email: resource.email, phone: resource.phone, id: resource.id, role: resource.role}
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_with do |format|
      format.all {head :no_content}
      format.any(*navigational_formats) {redirect_to after_sign_out_path_for(resource_name)}
    end
  end

end
