# frozen_string_literal: true

# student courses controller
class StudentCoursesController < ApplicationController
  def index
    @course = current_user.courses if current_user.present?
  end
end
