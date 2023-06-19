# frozen_string_literal: true

# home_controller
class HomeController < ApplicationController
  def index
    @courses = Course.all
    @course = Course.last
  end

  def show; end

  def course
    @course = Course.all
    @courses = Course.first
  end


  def course_lesson
    course = Course.find(params[:id])
    @c = course.lessons
  end

  def lesson_video
    @c = course.lessons
    @l = Lesson.find(params[:id])
  end
end
