# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
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

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.instructor? && resource.verified?
      # Redirect to the instructor dashboard or any other page
      instructor_dashboard_path
    else
      # Redirect to the default path for other users
      super
    end
  end
end
