# frozen_string_literal: true

# enrollment controller
class EnrollmentsController < ApplicationController
  def enroll
    user = current_user
    if user.courses.include?(@course)
      flash[:notice] = 'You are already enrolled in this course'
    else
      @course = Course.find(params[:id])
      current_user.courses << @course
      redirect_to course_url(@course), notice: 'Successfully enrolled in the course.'
    end
  end

  def show
    @course = Course.find(params[:id])
    @enrollment = Enrollment.new
  end
end
