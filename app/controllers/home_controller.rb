# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    render 'home/show'
  end

  def course
    @course = Course.all
    @courses = Course.first
  end

  def contact
  end
end
