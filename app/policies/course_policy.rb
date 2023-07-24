# frozen_string_literal: true

# course_policy
class CoursePolicy < ApplicationPolicy
  def create?
    user.instructor? || user.admin?
  end

  def index?
    user.instructor? || user.admin?
  end

  def update?
    user.instructor? || user.admin?
  end

  def destroy?
    user.instructor? || user.admin?
  end

  def create?
    user.instructor? || user.admin?
  end

end
