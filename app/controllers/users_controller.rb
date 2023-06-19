class UsersController < ApplicationController
	def show
		@course = current_user.courses if current_user.present?
	end
end
