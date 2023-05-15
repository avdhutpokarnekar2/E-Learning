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

  def contact; end
end
