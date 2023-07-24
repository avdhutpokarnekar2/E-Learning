# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      email = params[:user][:email]
      resource = User.find_by(email: email)
      if resource.instructor? && !resource.verified?
        flash[:alert] = 'Your account has not been verified yet.'
        redirect_to new_user_session_path
      else
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        respond_with resource, location: after_sign_in_path_for(resource)
      end
    end
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
