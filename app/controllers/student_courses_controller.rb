# frozen_string_literal: true

class StudentCoursesController < ApplicationController
  def index
    @course = current_user.courses if current_user.present?
  end
end
