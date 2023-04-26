# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    render 'home/show'
  end

  def cours
    @course = Course.all
    @courses = Course.first
  end
end
