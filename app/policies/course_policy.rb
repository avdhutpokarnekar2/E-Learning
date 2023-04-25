# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy
   # attr_reader :current_user

	  # def initialize(current_user)
	  #   @current_user = current_user
	  # end

	  def create?
	  	 p user.instructor?
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
