# frozen_string_literal: true

# main application
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :set_csrf_cookie
  before_action :authenticate_user!
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def verify
  #   if current_user.instructor && current_user.verified == false
  #     flash[:alert] = "You are not authorized."
  #     redirect_to courses_path
  #   end
  # end

  private

  def user_not_authorized(_exception)
    redirect_to root_path
  end
end
