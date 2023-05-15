# frozen_string_literal: true

# course_policy
class CoursePolicy < ApplicationPolicy
  def create?
    user.instructor?
  end

  def index?
    user.instructor?
  end

  def update?
    user.instructor?
  end

  def destroy?
    user.instructor?
  end
end
