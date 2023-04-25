# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :set_csrf_cookie
  # before_action :authenticate_user!
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # def set_csrf_cookie
  #   cookies['CSRF-TOKEN'] = form_authenticity_token
  # end

  def user_not_authorized(exception)
    redirect_to root_path
  end
end
