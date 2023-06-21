# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  def enroll
    if current_user.courses.include?(@course)
      notice => 'You are already enrolled in this course'
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
