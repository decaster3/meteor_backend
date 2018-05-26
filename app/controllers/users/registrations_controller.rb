# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    user = User.find_by(phone: params[:user][:phone])
    if user && user.confirmed_at.nil?
      if user.possible_to_send_sms?
        user.delete
      else
        return render json: {error: 'Not allowed to request SMS.'}, status: 422
      end
    end
    if params[:user][:inviter_token] || params[:user][:inviter_id]
      user = User.find_by_token(params[:user][:inviter_token])
      if user
        params[:user][:inviter_id] = user.id
      else
        return render json: {
            error: 'Invalid token.'
        }, status: 422
      end
    end
    # user.delete if user && user.verified_at.nil?
    build_resource(sign_up_params)
    resource.save
    # yield resource if block_given?
    if resource.persisted?
      # user should enter verification code that came to his phone
      # s = SmsValidation.order('expires_at DESC').limit(1).first
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:inviter_id, keys: [:inviter_id])
  # end
  #
  def sign_up_params
    if params[:user][:inviter_token]
      user = User.find_by_token(params[:user][:inviter_token])
      if user
        params[:user][:inviter_id] = user.id
        params.require(:user).permit(:name, :phone, :password, :inviter_id)
      else
        params.require(:user).permit(:name, :phone, :password)
      end
    else
      params.require(:user).permit(:name, :phone, :password)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
