class DashboardController < ApplicationController

skip_authorization_check # TODO: Add authorization to this controller

	def show
		case current_user.role

			when "admin"
				@recent_users = User.limit(5).order("created_at DESC").group_by(&:role)
			when "staff"
				
			when "teacher"
				return true
			when "student"
				return true
			else
				return false
				
		end
	end

end