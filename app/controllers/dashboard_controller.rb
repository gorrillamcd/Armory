class DashboardController < ApplicationController

	def show
		case current_user.role

			when "admin"
				@users = User.all
			when "staff"
				return true
			when "teacher"
				return true
			when "student"
				return true
			else
				return false
				
		end
	end

end