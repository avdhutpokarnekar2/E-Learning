# frozen_string_literal: true

# profile_controller
class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_index_path(@user), notice: 'User successfully updated.'
    else
      redirect_to profile_index_path(@user.errors), alert: @user.errors.full_messages
    end
  end

  def show
    @c = Course.last
  end
  def user_courses    
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :mobile_no, :email, :id)
  end
end
